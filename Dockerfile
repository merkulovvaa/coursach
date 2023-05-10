# Layer 0. Define default env variables
ARG DEFAULT_APP_HOME="/home/ruby/rails-app"
ARG DEFAULT_GEM_HOME="/usr/local/bundle"
ARG PATH=$GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

# Layer 1. Download base ruby image
FROM ruby:3.1.2-slim as builder

# Layer 3. Copy aptfile to install apt deps
WORKDIR /home
COPY aptfile aptfile

# Layer 4. Updating and installing the necessary software for the Web server. Cleaning to reduce image size.
RUN apt-get update -qq && xargs apt-get install --no-install-recommends -yq < aptfile && export DEBIAN_FRONTEND=noninteractive \
  && apt-get clean && apt-get autoclean && apt-get clean all \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

#. Layer 5. Inherit default variabels
ARG PATH=$GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
ARG DEFAULT_APP_HOME
ENV APP_HOME=${DEFAULT_APP_HOME}

# Layer 6. Adding config options for bundler.
RUN echo "gem: --no-rdoc --no-ri" > /etc/gemrc
# Layer 7.  Specifying the directory in which the gemfiles will be placed.
WORKDIR ${APP_HOME}
# Layer 8. Copying Gemfile and Gemfile.lock.
COPY Gemfile* ./
# Layer 9. Installing dependencies.
RUN bundle check || bundle install --jobs 20 --retry 5

# Layer 10. Use multistage.
FROM ruby:3.1.2-slim as runner

# Layer 11. Install runtime dependecies.
# hadolint ignore=DL3008
RUN apt-get update && apt-get install  --no-install-recommends libvips-dev libcurl4-openssl-dev git vim libpq-dev glibc-source imagemagick -yq \
  && apt-get clean && apt-get autoclean && apt-get clean all \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# Layer 12. Create new user
RUN useradd ruby

# Layer 13. Create dir for bundle audit
RUN mkdir -p /home/ruby/.cache && chmod 777 /home/ruby/.cache
RUN mkdir -p /home/ruby/.local && chmod 777 /home/ruby/.local
RUN mkdir -p /home/ruby/rails-app/log/ && touch /home/ruby/rails-app/log/development.log && chmod 0664 /home/ruby/rails-app/log/development.log

# Layer 14. Switch user
USER ruby:ruby

# Layer 15 Inherit and modify default vars
ARG DEFAULT_APP_HOME
ARG DEFAULT_GEM_HOME
ENV GEM_HOME=${DEFAULT_GEM_HOME}
ARG PATH=$GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
ARG APP_HOME=${DEFAULT_APP_HOME}

# Layer 16.  Specifying the directory in which the application will be placed.
WORKDIR ${APP_HOME}

# Layer 17. Copy gems to new image changing their permissions
COPY --from=builder   --chown=ruby:ruby  /usr/local/bundle /usr/local/bundle

# Layer 18. Copy application changing its permissions
COPY --chown=ruby:ruby . .

# Layer 19. Define port to expose
EXPOSE 3000/tcp

# Layer 20. Command to start application.
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

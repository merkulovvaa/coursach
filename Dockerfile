# Dockerfile.ruby
FROM phusion/passenger-ruby31:2.3.0
# Set correct environment variables.
ENV HOME /root

CMD ["/sbin/my_init"]

RUN ruby -v
RUN rm -f /etc/service/sshd/down

COPY --chown=app:app ./ /home/app/webapp
ENV HOME /home/app/webapp
WORKDIR $HOME/
COPY Gemfile* $HOME/

RUN bundle config --global silence_root_warning 1

RUN useradd ruby

RUN bash -lc 'chmod -R 777 /home/app/webapp/'

RUN chmod 777 /home/app/webap
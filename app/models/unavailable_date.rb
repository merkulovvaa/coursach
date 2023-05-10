# == Schema Information
#
# Table name: unavailable_dates
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UnavailableDate < ApplicationRecord
  belongs_to :doctor, optional: true
end

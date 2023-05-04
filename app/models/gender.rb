# == Schema Information
#
# Table name: genders
#
#  id          :integer          not null, primary key
#  name_gender :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Gender < ApplicationRecord
  has_many :doctors
  has_many :patients
end

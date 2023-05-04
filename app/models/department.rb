# == Schema Information
#
# Table name: departments
#
#  id          :integer          not null, primary key
#  name_depart :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Department < ApplicationRecord
  has_many :doctors
end

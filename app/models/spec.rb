# == Schema Information
#
# Table name: specs
#
#  id         :integer          not null, primary key
#  name_spec  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Spec < ApplicationRecord
  has_many :doctors
end

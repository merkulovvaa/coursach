# == Schema Information
#
# Table name: analyses
#
#  id            :integer          not null, primary key
#  name_analysis :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Analysis < ApplicationRecord
  has_many :patient_analisis
end

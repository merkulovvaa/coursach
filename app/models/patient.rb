# == Schema Information
#
# Table name: patients
#
#  id                 :integer          not null, primary key
#  address            :string
#  birth_date         :date
#  email              :string
#  full_name          :string
#  phone_number       :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  gender_id          :integer          not null
#  outpatient_card_id :integer          not null
#
# Indexes
#
#  index_patients_on_gender_id           (gender_id)
#  index_patients_on_outpatient_card_id  (outpatient_card_id)
#
# Foreign Keys
#
#  gender_id           (gender_id => genders.id)
#  outpatient_card_id  (outpatient_card_id => outpatient_cards.id)
#
class Patient < ApplicationRecord
  belongs_to :gender
  belongs_to :outpatient_card
end

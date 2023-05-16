# == Schema Information
#
# Table name: doctors
#
#  id                     :integer          not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  full_name              :string
#  rating                 :float
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  start_working_date     :date
#  status                 :integer          default("active")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  category_id            :integer          not null
#  department_id          :integer          not null
#  gender_id              :integer          not null
#  spec_id                :integer          not null
#
# Indexes
#
#  index_doctors_on_category_id           (category_id)
#  index_doctors_on_department_id         (department_id)
#  index_doctors_on_email                 (email) UNIQUE
#  index_doctors_on_gender_id             (gender_id)
#  index_doctors_on_reset_password_token  (reset_password_token) UNIQUE
#  index_doctors_on_spec_id               (spec_id)
#
# Foreign Keys
#
#  category_id    (category_id => categories.id)
#  department_id  (department_id => departments.id)
#  gender_id      (gender_id => genders.id)
#  spec_id        (spec_id => specs.id)
#
class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :gender
  belongs_to :spec
  belongs_to :department
  belongs_to :category
  has_many :unavailable_dates
  has_many :appointments

  enum status: { active: 0, inactive: 1 }

  def update_rating
    update_column(:rating, appointments.finished.average(:rating))
  end

  scope :by_spec, ->(name_spec) { joins(:spec).where(spec: { name_spec: name_spec })}

  delegate :name_gender, to: :gender, prefix: true, allow_nil: true
  delegate :name_spec, to: :spec, prefix: true, allow_nil: true
  delegate :name_department, to: :depart, prefix: true, allow_nil: true
  delegate :category_name, to: :category, prefix: true, allow_nil: true
end


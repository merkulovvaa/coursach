class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :outpatient_card, null: false, foreign_key: true
      t.date :appointment_date
      t.string :report

      t.timestamps
    end
  end
end

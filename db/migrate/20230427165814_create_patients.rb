class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :full_name
      t.string :address
      t.string :phone_number
      t.string :email
      t.date :birth_date
      t.references :gender, foreign_key: true

      t.timestamps
    end
  end
end

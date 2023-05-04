class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :full_name
      t.string :email
      t.references :gender, null: false, foreign_key: true
      t.references :spec, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.date :start_working_date

      t.timestamps
    end
  end
end

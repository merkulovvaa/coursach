class CreatePatientAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_analyses do |t|
      t.references :analysis, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.date :analysis_date

      t.timestamps
    end
  end
end

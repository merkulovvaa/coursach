class CreateOutpatientCards < ActiveRecord::Migration[7.0]
  def change
    create_table :outpatient_cards do |t|
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end

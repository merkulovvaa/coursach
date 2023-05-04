class CreateAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :analyses do |t|
      t.string :name_analysis

      t.timestamps
    end
  end
end

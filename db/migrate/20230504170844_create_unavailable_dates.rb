class CreateUnavailableDates < ActiveRecord::Migration[7.0]
  def change
    create_table :unavailable_dates do |t|

      t.timestamps
    end
  end
end

class AddStartDateAndEndDateToUnavailableDates < ActiveRecord::Migration[7.0]
  def change
    add_column :unavailable_dates, :start_date, :date
    add_column :unavailable_dates, :end_date, :date
    add_reference :unavailable_dates, :doctor, null: false, foreign_key: true
  end
end

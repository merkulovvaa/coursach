class AddLeaveTypeToUnavailableDates < ActiveRecord::Migration[7.0]
  def change
    add_column :unavailable_dates, :leave_type, :integer, default: 0
  end
end

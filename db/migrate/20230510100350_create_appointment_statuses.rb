class CreateAppointmentStatuses < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :status, :integer, default: 0
  end
end

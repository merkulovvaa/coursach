class AddAppTimeToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :app_time, :time
  end
end

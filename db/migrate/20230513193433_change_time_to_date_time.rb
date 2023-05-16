class ChangeTimeToDateTime < ActiveRecord::Migration[7.0]
  def up
    change_column :appointments, :app_time, :datetime
  end

  def down
    change_column :appointments, :app_time, :time
  end
end

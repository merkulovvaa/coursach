class DoctorStatuses < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :status, :integer, default: 0
  end
end


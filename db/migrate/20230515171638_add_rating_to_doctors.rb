class AddRatingToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :rating, :float
  end
end

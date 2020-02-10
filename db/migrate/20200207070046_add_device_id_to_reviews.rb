class AddDeviceIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :device_token, :string
  end
end

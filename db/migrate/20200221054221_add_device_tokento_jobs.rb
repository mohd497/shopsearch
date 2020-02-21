class AddDeviceTokentoJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :device_token, :string
  end
end

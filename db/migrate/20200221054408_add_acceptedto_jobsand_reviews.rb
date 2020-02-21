class AddAcceptedtoJobsandReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :accepted, :boolean, default: false
    add_column :reviews, :accepted, :boolean, default: false
  end
end

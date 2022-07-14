class AddRequestorToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :requestor, :bigint
  end
end
class RemoveFriendFromNotifications < ActiveRecord::Migration[6.1]
  def change
    remove_column :notifications, :friend_id, :bigint
  end
end

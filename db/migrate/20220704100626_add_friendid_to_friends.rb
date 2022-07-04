class AddFriendidToFriends < ActiveRecord::Migration[6.1]
  def change
    add_column :friends, :friendid, :bigint
  end
end

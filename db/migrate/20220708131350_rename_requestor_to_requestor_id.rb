class RenamerequestorTorequestor_id< ActiveRecord::Migration[6.1]
  def change
    rename_column :notifications, :requestor, :requestor_id
    rename_column :friends, :friend_id, :friend_id
  end
end

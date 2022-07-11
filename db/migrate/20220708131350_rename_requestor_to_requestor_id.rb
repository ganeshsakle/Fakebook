class Renamerequestor_idTorequestor_idId < ActiveRecord::Migration[6.1]
  def change
    rename_column :notifications, :requestor_id, :requestor_id_id
    rename_column :friends, :friend_id, :friend_id
  end
end

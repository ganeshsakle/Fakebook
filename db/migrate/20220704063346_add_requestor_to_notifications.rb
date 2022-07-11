class Addrequestor_idToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :requestor_id, :bigint
  end
end

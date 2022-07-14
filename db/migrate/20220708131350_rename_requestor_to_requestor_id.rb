class RenameRequestorToRequestorId< ActiveRecord::Migration[6.1]
  def change
    rename_column :notifications, :requestor, :requestor_id
  end
end

class RenameSnToProviderInAUthentications < ActiveRecord::Migration
  def change
    rename_column :authentications, :sn, :provider
  end
end

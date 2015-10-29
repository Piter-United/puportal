class RemoveCoverFromCommunities < ActiveRecord::Migration
  def change
    remove_column :communities, :links
  end
end

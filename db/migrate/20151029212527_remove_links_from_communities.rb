class RemoveLinksFromCommunities < ActiveRecord::Migration
  def change
    remove_column :communities, :cover
  end
end

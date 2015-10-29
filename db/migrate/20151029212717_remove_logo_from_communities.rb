class RemoveLogoFromCommunities < ActiveRecord::Migration
  def change
    remove_column :communities, :logo
  end
end

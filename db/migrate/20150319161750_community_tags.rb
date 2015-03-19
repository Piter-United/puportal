class CommunityTags < ActiveRecord::Migration
  def change
    add_column :communities, :tags, :text, array: true, default: []
  end
end

class CommunitiesHashtag < ActiveRecord::Migration
  def change
    add_column :communities, :hashtag, :string
  end
end

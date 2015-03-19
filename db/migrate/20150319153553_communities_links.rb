class CommunitiesLinks < ActiveRecord::Migration
  def change
    remove_column :communities, :site
    remove_column :communities, :vk
    remove_column :communities, :facebook
    remove_column :communities, :twitter
    remove_column :communities, :meetupcom
    remove_column :communities, :google
    remove_column :communities, :leaders
    add_column :communities, :links, :text, :after => :description
  end
end

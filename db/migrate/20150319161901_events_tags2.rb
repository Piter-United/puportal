class EventsTags2 < ActiveRecord::Migration
  def app
  	remove_column :events, :tags
    add_column :events, :tags, :text, array: true, default: []
  end
end

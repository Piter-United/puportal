class EventsTags < ActiveRecord::Migration
  def change
    add_column :events, :tags, :text, array: true, default: []
  end
end

class AddLocationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :location, :json, default: '{}'
  end
end

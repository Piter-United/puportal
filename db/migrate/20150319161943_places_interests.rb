class PlacesInterests < ActiveRecord::Migration
  def change
    add_column :places, :interests, :text, array: true, default: []
  end
end

class PlacesAddLink < ActiveRecord::Migration
  def change
    add_column :places, :link, :string
  end
end

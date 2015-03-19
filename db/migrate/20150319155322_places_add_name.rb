class PlacesAddName < ActiveRecord::Migration
  def change
    add_column :places, :name, :string, :before => :address
  end
end

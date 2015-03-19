class PlacesAddContacts < ActiveRecord::Migration
  def change
    add_column :places, :contacts, :text
  end
end

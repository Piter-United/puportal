class RenameEventsLocationToAddress < ActiveRecord::Migration
  def change
    rename_column :events, :location, :address
  end
end

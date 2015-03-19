class DatesAfishaTags < ActiveRecord::Migration
  def change
    remove_column :events, :date
    add_column :events, :logo, :string, :after => :location
  end
end

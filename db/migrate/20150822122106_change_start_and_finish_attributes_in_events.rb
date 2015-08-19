class ChangeStartAndFinishAttributesInEvents < ActiveRecord::Migration
  def change
    remove_column :events, :date
    remove_column :events, :start, :datetime
    remove_column :events, :finish, :datetime
    add_column :events, :start, :datetime
    add_column :events, :finish, :datetime
  end
end

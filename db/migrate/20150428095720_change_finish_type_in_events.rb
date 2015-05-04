class ChangeFinishTypeInEvents < ActiveRecord::Migration
  def change
    change_column :events, :finish, :time
  end
end

class ChangeStartTypeInEvents < ActiveRecord::Migration
  def change
    change_column :events, :start, :time
  end
end

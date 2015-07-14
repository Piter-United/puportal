class RenameMembersToUser < ActiveRecord::Migration
  def change
  	rename_table :members, :users
  end
end

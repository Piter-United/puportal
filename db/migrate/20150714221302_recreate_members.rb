class RecreateMembers < ActiveRecord::Migration
  def change
  	create_table :members do |t|
  		t.integer :community_id
  		t.integer :user_id
  	end

  	add_index :members, [:community_id, :user_id], unique: true
  end
end

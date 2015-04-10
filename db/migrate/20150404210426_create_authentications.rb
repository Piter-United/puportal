class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :owner_id
      t.string :sn, null: false
      t.string :uid
      t.string :token
      t.datetime :expires_at
      t.timestamps
    end

    add_index :authentications, [:sn, :uid], unique: true
  end
end

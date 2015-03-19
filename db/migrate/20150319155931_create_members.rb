class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.text :links
      t.string :email
      t.string :login
      t.text :password
      t.string :avatar

      t.timestamps null: false
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.time :date
      t.string :title
      t.text :description
      t.integer :community_id
      t.integer :location

      t.timestamps null: false
    end
  end
end

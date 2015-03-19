class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.text :description
      t.text :leaders
      t.string :site
      t.string :vk
      t.string :facebook
      t.string :twitter
      t.string :meetupcom
      t.string :google

      t.timestamps null: false
    end
  end
end

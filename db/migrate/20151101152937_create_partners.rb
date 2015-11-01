class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :logo
      t.string :url
      t.string :status

      t.timestamps null: false
    end
  end
end

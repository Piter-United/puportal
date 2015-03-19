class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :address
      t.text :description
      t.integer :company_id
      t.text :photos

      t.timestamps null: false
    end
  end
end

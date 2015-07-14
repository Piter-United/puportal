class AddShortNameToCommunities < ActiveRecord::Migration
  def change
  	add_column :communities, :short_name, :string
  end
end

class AddElemToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :elem, :string
  end
end

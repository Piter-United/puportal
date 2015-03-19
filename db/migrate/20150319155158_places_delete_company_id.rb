class PlacesDeleteCompanyId < ActiveRecord::Migration
  def change
    remove_column :places, :company_id
  end
end

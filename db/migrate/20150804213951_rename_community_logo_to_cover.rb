class RenameCommunityLogoToCover < ActiveRecord::Migration
  def change
    rename_column :communities, :logo, :cover
  end
end

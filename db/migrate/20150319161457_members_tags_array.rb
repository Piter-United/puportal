class MembersTagsArray < ActiveRecord::Migration
  def change
    add_column :members, :skills, :text, array: true, default: []
  end
end

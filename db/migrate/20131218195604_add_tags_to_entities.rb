class AddTagsToEntities < ActiveRecord::Migration
  def change
    add_column :entities, :tags, :string
  end
end

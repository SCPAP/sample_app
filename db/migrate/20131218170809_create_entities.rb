class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.binary :image
      t.string :latitude
      t.string :longitude
      t.string :mime_type
      t.string :filename
      t.string :tags

      t.timestamps
    end
  end
end

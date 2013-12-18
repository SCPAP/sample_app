class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.binary :image
      t.string :latitude
      t.string :longitude
      t.string :mine_type
      t.string :filename

      t.timestamps
    end
  end
end

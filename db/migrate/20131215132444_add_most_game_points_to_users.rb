class AddMostGamePointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :most_game_points, :number
  end
end

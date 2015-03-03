class AddVisibleToGames < ActiveRecord::Migration
  def change
    add_column :games, :visible, :boolean
  end
end

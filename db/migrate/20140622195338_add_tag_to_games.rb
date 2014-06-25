class AddTagToGames < ActiveRecord::Migration
  def change
    add_column :games, :tag, :string
  end
end

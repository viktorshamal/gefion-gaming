class AddGameToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :gameid, :integer
  end
end

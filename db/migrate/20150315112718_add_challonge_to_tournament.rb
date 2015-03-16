class AddChallongeToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :challonge_id, :integer
  end
end

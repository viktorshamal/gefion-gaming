class AddTournamentIdToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :tournament_id, :integer
  end
end

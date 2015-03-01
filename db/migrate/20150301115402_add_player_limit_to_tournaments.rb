class AddPlayerLimitToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :player_limit, :integer
  end
end

class AddGameTagToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :gametag, :string
  end
end

class AddPlatformToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :platform, :string
  end
end

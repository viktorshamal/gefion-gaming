class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.integer :game_id
      t.datetime :tournament_date
      t.integer :maxplayers

      t.timestamps
    end
  end
end

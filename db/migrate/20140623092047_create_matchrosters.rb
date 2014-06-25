class CreateMatchrosters < ActiveRecord::Migration
  def change
    create_table :matchrosters do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :tournament_id
      t.integer :roundNumber
      t.boolean :completed
      t.integer :winner

      t.timestamps
    end
  end
end

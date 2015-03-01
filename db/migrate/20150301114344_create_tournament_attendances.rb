class CreateTournamentAttendances < ActiveRecord::Migration
  def change
    create_table :tournament_attendances do |t|
      t.integer :user_id
      t.integer :tournament_id

      t.timestamps
    end
  end
end

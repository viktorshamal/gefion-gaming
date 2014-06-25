class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :platforms
      t.text :tournaments

      t.timestamps
    end
  end
end

class AddXpToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :xp, :integer
  end
end

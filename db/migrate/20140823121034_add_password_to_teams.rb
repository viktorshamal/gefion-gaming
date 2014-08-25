class AddPasswordToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :password, :string
  end
end

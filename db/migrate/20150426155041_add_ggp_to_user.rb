class AddGgpToUser < ActiveRecord::Migration
  def change
    add_column :users, :ggp, :integer
  end
end

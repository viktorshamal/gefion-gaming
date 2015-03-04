class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|

      t.string :description
      t.integer :tournament_id
      t.timestamps
    end
  end
end

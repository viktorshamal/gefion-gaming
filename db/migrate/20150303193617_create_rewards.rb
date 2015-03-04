class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|

      t.integer :place
      t.string :description
      t.timestamps
    end
  end
end

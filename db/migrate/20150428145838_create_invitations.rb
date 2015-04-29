class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :team_id
      t.integer :sender_id

      t.timestamps
    end
  end
end

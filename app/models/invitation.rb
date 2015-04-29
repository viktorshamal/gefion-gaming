class Invitation < ActiveRecord::Base
  has_one :user
  has_one :team

  validates_presence_of :user_id, :team_id, :sender_id

  def sender
    User.find(self.sender_id)
  end

  def team
    Team.find(self.team_id)
  end
end

class Teamroster < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  validates_uniqueness_of :user_id, :scope => :team_id

  validate :five_team_limit, :five_user_limit, :correct_password

  def five_team_limit
    errors.add(:base, "You can't be part of more than 5 teams") if User.find(self.user_id).teams.count >= 5
  end

  def five_user_limit
    errors.add(:base, "A team can't have more than five members") if Team.find(self.team_id).users.count >= 5
  end

  def correct_password
    team = Team.find(self.team_id)

    if team.has_password?
      errors.add(:base, 'Wrong password') unless team.password == @password
    end
  end

  def password
    @password
  end

  def password=(password)
    @password=password
  end
end

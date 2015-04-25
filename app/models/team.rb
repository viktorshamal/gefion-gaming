class Team < ActiveRecord::Base
  has_many :teamrosters
  has_many :users, through: :teamrosters
  has_many :tournament_teams

  validates_uniqueness_of :name, :case_sensitive => false
  validates_format_of :name, with: /(\w|\s)/
  validates_length_of :name, :minimum => 3, :maximum => 25
  validates_length_of :password, :minimum => 3, :maximum => 30
  validate :five_team_limit

  def five_team_limit
      errors.add(:base, "You can't be part of more than 5 teams") if User.find(self.owner_id).teams.count >= 5
  end

  def has_password?
    self.password ? @has_password = true : @has_password = false
  end

  def get_owner
    User.find(self.owner_id)
  end
end

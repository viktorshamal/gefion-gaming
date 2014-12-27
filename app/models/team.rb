class Team < ActiveRecord::Base
  has_many :teamrosters
  has_many :users, through: :teamrosters
  has_many :tournament_teams

  validates_uniqueness_of :name

  def has_password?
    self.password ? @has_password = true : @has_password = false
  end

  def get_owner
    User.find(self.owner_id)
  end
end

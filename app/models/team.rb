class Team < ActiveRecord::Base
  has_many :teamrosters
  has_many :users, through: :teamrosters
  has_many :tournament_teams

  validates_uniqueness_of :name
  validates_format_of :name, with: /\A[a-zA-Z]+\z/
  validates_length_of :name, :minimum => 3, :maximum => 15
  validates_length_of :password, :minimum => 3, :maximum => 30

  def has_password?
    self.password ? @has_password = true : @has_password = false
  end

  def get_owner
    User.find(self.owner_id)
  end
end

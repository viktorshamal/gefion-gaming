class Team < ActiveRecord::Base
  has_many :teamrosters
  has_many :users, through: :teamrosters
  has_many :tournament_teams
end

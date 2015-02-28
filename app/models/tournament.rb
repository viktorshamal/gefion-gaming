class Tournament < ActiveRecord::Base
  belongs_to :game
  has_many :tournament_teams
  has_many :teams, through: :tournament_teams

  def players
    self.teams.map(&:users).flatten
  end
end

class Tournament < ActiveRecord::Base
  belongs_to :game
  has_many :tournament_teams
  has_many :teams, through: :tournament_teams

  has_many :tournament_attendances
  has_many :users, through: :tournament_attendances

  has_many :rules
  has_many :rewards

  def players
    self.teams.map(&:users).flatten
  end

  def live_image_uri
    Challonge::Tournament.find(self.challonge_id)
  end

  private

  def user_params
    params.require(:game_id,:tournament_date, :maxplayers, :player_limit,).permit(:challonge_id)
  end
end

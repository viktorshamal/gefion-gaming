class Game < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :tournaments

  def next_tournament
    self.tournaments.order(:tournament_date).first
  end
end

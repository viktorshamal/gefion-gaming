class Game < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :tournaments

  def next_tournament
    self.tournaments.where(:winner_id => nil).order(:tournament_date).first
  end
end

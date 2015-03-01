class TournamentAttendance < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :tournament_id
end
class Matchroster < ActiveRecord::Base
  has_many :teams
  belongs_to :tournament
end

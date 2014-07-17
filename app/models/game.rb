class Game < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :tournaments
end

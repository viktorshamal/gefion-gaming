class Game < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :tournaments
  has_many :users, through: :tournaments
end

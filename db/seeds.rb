# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
games_list = [
      ["Fifa 14","Xbox 360","0","fifa-14"],
      ["League of Legends", "PC", "0", "lol"],
      ["Civilization IV","PC","0","civ-5"]
]

games_list.each do |name, platforms, tournaments, tag|
  Game.create(name: name, platforms: platforms, tournaments: tournaments, tag: tag)
end
=end

=begin
user_list = %w(Mathias Neufeld Mohamed Benjamin Rick Astley Oscar)

user_list.each do |name|
  User.create(name: name.to_s)
end
=end

=begin
team_list = %w(Crystalstuff Mariobrothers Wrongcasteliers)

team_list.each do |name|
  Team.create(name: name)
end
=end
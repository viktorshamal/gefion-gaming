# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
games_list = [
      ['League of Legends', 'PC', 'lol'],
      ['Civilization IV', 'PC', 'civ-5']
]

games_list.each do |name, platforms, tag|
  Game.create(name: name, platforms: platforms, tag: tag)
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


#Tournament.create(gameid: 1, gametag: "fifa-14", maxplayers: 16, tournament_date: DateTime.current)

=begin
attending_list = %w(1, 2, 3)

attending_list.each do |teamid|
  Tournamentroster.create(tournamentid: 1, teamid: teamid)
end
=end

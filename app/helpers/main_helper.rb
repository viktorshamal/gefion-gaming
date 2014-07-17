module MainHelper
  def get_usersinteam id
    teamusers = Array.new

    Teamroster.where(team_id: id).each do |x|
      teamusers.push(User.find(x.user_id))
    end


    return teamusers
  end


end

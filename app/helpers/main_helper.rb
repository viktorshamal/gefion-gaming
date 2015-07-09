module MainHelper
  def get_usersinteam id
    teamusers = Array.new

    Teamroster.where(team_id: id).each do |x|
      teamusers.push(User.find(x.user_id))
    end
  end

  def cover_paths
    imgs = {}
    Dir.chdir("#{Rails.root}/app/assets/images/game-images") do
      imgs = Dir["**"].inject({}) {|h,f| h.merge! f => view_context.image_url('game-images/' + f)}
    end
  end

end

class TeamRostersController < ApplicationController
  def create
    tr = Teamroster.new(:team_id => params[:team_id], :user_id => current_user.id, :password => params[:password])

    respond_to do |format|
      if tr.save
        format.html {redirect_to :back}
        if params[:from_invite]
          format.js {redirect_to invitation_destroy_path(:team_id=>params[:team_id],:user_id => current_user.id)}
        else
          format.js {render 'team_rosters/updateui'}
        end
      else
        format.html {redirect_to :back}
        format.js {render 'errors/warning', locals: {errors: tr.errors.full_messages} }
      end
    end
  end

  def remove
    team = Team.find(params[:team_id])

    Teamroster.where('user_id = ? AND team_id = ?', current_user.id, team.id).first.destroy

    respond_to do |format|
      format.html {redirect_to :back}
      if team.users.count == 0
        format.js { redirect_to team_destroy_path(:id =>team.id)}
      else
        format.js {render 'team_rosters/updateui'}
      end
    end
  end

  def new
  end

  private
  def team_rosters_params
    params.require(:team_roster).permit(:team_id, :user_id, :password)
  end
end

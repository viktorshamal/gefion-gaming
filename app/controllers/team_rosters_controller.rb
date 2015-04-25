class TeamRostersController < ApplicationController
  def create
    tr = Teamroster.new(:team_id => params[:team_id], :user_id => current_user.id, :password => params[:password])

    respond_to do |format|
      if tr.save
        format.html {redirect_to :back}
        format.js {render 'team_rosters/updateui'}
      else
        format.html {redirect_to :back}
        format.js {render 'errors/warning', locals: {errors: tr.errors.full_messages} }
      end
    end
  end

  def remove
    Teamroster.where('user_id = ? AND team_id = ?', current_user.id, params[:team_id]).first.destroy

    respond_to do |format|
      format.html {redirect_to :back}
      format.js {render 'team_rosters/updateui'}
    end
  end

  def new
  end

  private
  def team_rosters_params
    params.require(:team_roster).permit(:team_id, :user_id, :password)
  end
end

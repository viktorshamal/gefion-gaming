class TeamRostersController < ApplicationController
  def create
    @team = Team.find_by_name(params[:team_name])

    tr = Teamroster.new
    tr.team_id = @team.id
    tr.user_id = params[:user_id]

    tr.save

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end


  end

  def destroy
    tr = Teamroster.new
  end

  def remove
    Teamroster.where('user_id = ? AND team_id = ?', current_user.id, params[:team_id]).first.destroy

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def new
  end
end

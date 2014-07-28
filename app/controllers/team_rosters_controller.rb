class TeamRostersController < ApplicationController
  def create
    @teamroster = Teamroster.new
    @teamroster.team_id = Team.find_by_name(params[:team_name]).id
    @teamroster.user_id = params[:user_id]

    @teamroster.save

    redirect_to :back
  end

  def destroy
    @teamroster = Teamroster.new
  end

  def remove
    @teamroster = Teamroster.where('user_id = ? AND team_id = ?', current_user.id, params[:team_id]).first
    @teamroster.destroy

    redirect_to :back
  end

  def new
  end
end

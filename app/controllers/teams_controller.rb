class TeamsController < ApplicationController
  def new

  end

  def create

    if current_user && current_user.teams.count < 5
      @team = Team.new(name: params[:name])
      Teamroster.create(:team_id => @team.id, :user_id => current_user.id) if @team.save
    end
    redirect_to :back
  end

  def show
    @suggestions = Team.all
    respond_to do |format|
      format.html
      format.json { render json: @suggestions }
    end
  end

  def load_suggestions

  end

  private
  def team_params
    params.require(:team).permit(:name, :user)
  end
end

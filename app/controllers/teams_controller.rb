class TeamsController < ApplicationController
  def new

  end

  def create
    @team = Team.new(name: params[:name])

    @team.save

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

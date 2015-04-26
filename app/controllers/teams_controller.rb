class TeamsController < ApplicationController
  def new

  end

  def create
    team = Team.new(:name => params[:name], :owner_id => current_user.id, :xp => 0, :password => params[:password]) if current_user

    respond_to do |format|
      format.html {redirect_to :back}
      if team.save
        format.js { redirect_to team_rosters_create_path(:user_id=>current_user.id, :team_id=>team.id, :password => params[:password]) }
      else
        format.js { render 'errors/warning', locals: {errors: team.errors.full_messages} }
      end
    end
  end

  def remove
    Team.find(params[:id]).destroy

    respond_to do |format|
        format.js { render 'team_rosters/updateui'}
        format.html {redirect_to root}
    end
  end

  def show
    @suggestions = Team.all - current_user.teams
    
    respond_to do |format|
      format.html { render json: @suggestions.map { |team| {:name => team.name, :id => team.id, :hasPass => team.has_password?, :owner_uid => team.get_owner.uid}} }
      format.json { render json: @suggestions.map { |team| {:name => team.name, :id => team.id, :hasPass => team.has_password?, :owner_uid => team.get_owner.uid}} }
    end
  end

  def load_suggestions

  end

  private
  def team_params
    params.require(:team).permit(:name, :user,:xp)
  end
end

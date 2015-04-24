class TeamsController < ApplicationController
  def new

  end

  def create
    if current_user && current_user.teams.count < 5
      password = params[:password]
      @team = Team.new
      @team.name = params[:name]
      @team.owner_id=current_user.id
      @team.xp = 0
      if password
        @team.password = password
      end

      Teamroster.create(:team_id => @team.id, :user_id => current_user.id) if @team.save
    end
    respond_to do |format|
      format.html {redirect_to :back}
      if @team.save
        format.js {render 'team_rosters/updateui'}
      else
        format.js { render 'errors/warning', locals: {errors: @team.errors.full_messages} }
      end
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
    params.require(:team).permit(:name, :user)
  end
end

class TeamRostersController < ApplicationController
  def create

    @team = Team.find(params[:team_id])
    @user = User.find(params[:user_id])
    password = params[:password]
    tr = Teamroster.new

    @teamcount = @user.teams.count

    if @teamcount < 5

      if @team.has_password?
        if @team.password == password
          tr.team_id = @team.id
          tr.user_id = @user.id
        end
      else
        tr.team_id = @team.id
        tr.user_id = @user.id
      end

      raise 'error' unless tr.save
    else
      raise 'error'
    end

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

    @count = current_user.teams.count

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def new
  end
end

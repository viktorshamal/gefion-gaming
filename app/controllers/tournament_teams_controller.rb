class TournamentTeamsController < ApplicationController
  def create
    @team = Team.find(params[:team_id])
    @tournament = Tournament.find(params[:tournament_id])

    tt = TournamentTeam.new
    tt.tournament_id = @tournament.id
    tt.team_id = @team.id

    raise 'error ' unless tt.save

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def remove
    TournamentTeam.where('tournament_id = ? AND team_id = ?', params[:tournament_id], params[:team_id]).first.destroy

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end
end

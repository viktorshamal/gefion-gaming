class TournamentAttendancesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @tournament = Tournament.find(params[:tournament_id])



    ta = TournamentAttendance.new
    ta.tournament_id=@tournament.id
    ta.user_id=@user.id

    raise 'error' unless ta.save

    Challonge::Participant.create(:name => @user.id, :tournament => Challonge::Tournament.find(@tournament.challonge_id))

    respond_to do |format|
      format.html {redirect_to :back}
      format.js {render 'tournament_attendances/update_ui'}
    end

  end

  def remove
    @tournament = Tournament.find(params[:tournament_id])
    TournamentAttendance.where('tournament_id = ? AND user_id = ?', params[:tournament_id], params[:user_id]).first.destroy

    Challonge::Participant.find(:all, :params => {:name => params[:user_id], :tournament_id => @tournament.challonge_id})

    respond_to do |format|
      format.html {redirect_to :back}
      format.js {render 'tournament_attendances/update_ui'}
    end
  end
end

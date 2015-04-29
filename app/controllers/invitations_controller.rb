class InvitationsController < ApplicationController
  def index
  end

  def create
    invi = Invitation.new(:team_id=>params[:team_id], :user_id=>params[:user_id], :sender_id=>current_user.id)

    respond_to do |format|
      format.html { redirect_to :back }
      if invi.save
        format.js { render 'team_rosters/update_alerts' }
      else
        format.js {render 'errors/warning', locals: {errors: invi.errors.full_messages} }
      end
    end
  end

  def remove
    Invitation.where(:team_id => params[:team_id], :user_id => params[:user_id]).first.destroy

    respond_to do |format|
      format.js { render 'team_rosters/update_alerts', locals: {invi_count: current_user.invitations.count}}
    end
  end

  private
  def invitations_params
    params.require(:invitation).permit(:team_id, :user_id, :sender_id)
  end
end

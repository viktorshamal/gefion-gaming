class ConversationsController < ApplicationController
  def clear
    current_user.mailbox.notifications.each do |alert|
      alert.mark_as_read current_user
    end

    redirect_to main_index_path
  end

  def new_notify

  end

  def notify
    Mailboxer::Notification.notify_all(User.all, params[:body], params[:subject],nil,true,nil,false)

    redirect_to root_path
  end
end

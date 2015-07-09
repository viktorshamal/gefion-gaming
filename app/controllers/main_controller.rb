class MainController < ApplicationController
  include MainHelper

  def index
    if current_user
      gon.uid = current_user.uid
      @alerts = current_user.mailbox.notifications(:read => false)
    end

    @event = graph.get_object('957225767629260')
    @attending = graph.get_connections(@event['id'], 'attending')

    gon.push({
      :eventtime => @event['start_time'],
      :eventid => @event['id'],
      :fb_app_id => ENV['FB_APP_ID'],
      :cover_paths => cover_paths
    })

  end
end

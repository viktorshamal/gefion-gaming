class MainController < ApplicationController
  include MainHelper
  def index
    require 'koala'

    Koala.config.api_version = 'v2.0'

    if current_user
      gon.uid = current_user.uid

      @alerts = current_user.mailbox.notifications(:read => false)
      #@receipts = @alerts.first.receipts_for current_user
    end

    @graph = Koala::Facebook::API.new('280813985423323|lhjk41XXweokQ69YCzaDR-JnWek')

    @event = @graph.get_object('1651026781794018')

    gon.eventtime = @event['start_time']
    gon.eventid = @event['id']

    @attending = @graph.get_connections(gon.eventid, 'attending')

  end
end

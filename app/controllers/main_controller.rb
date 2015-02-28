class MainController < ApplicationController
  include MainHelper
  def index
    require 'koala'

    Koala.config.api_version = 'v2.0'

    if current_user
      gon.uid = current_user.uid

      @alerts = current_user.mailbox.notifications
      #@receipts = @alerts.first.receipts_for current_user
    end

    @graph = Koala::Facebook::API.new('CAACEdEose0cBAI1V4NTrcMiAfFl2pT67fXnzOPrLEIXrZBCqDkWGH3iSdCW8QN0XZAzqkZAyqYcLaosC66YuV53u0tatzUKx1vqS68TzJr5snHOklEDdvXXHMwsXHZAv2EYCmGxPyP6wVlcQw9fNZC3sqLj8rOE8JK02PZCxdh6V82yLEUBZB9qTD3o6IUGESD8KfasKsG8nvP4TsoZBMEAz8CJmRf74eDYZD')

    @event = @graph.get_object('1544292902497202')

    gon.eventtime = @event['start_time']
    gon.eventid = @event['id']

    @attending = @graph.get_connections(gon.eventid, 'attending')



  end
end

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

    @graph = Koala::Facebook::API.new(ENV['FB_TOKEN'])

    @event = @graph.get_object('957225767629260')

    gon.eventtime = @event['start_time']
    gon.eventid = @event['id']
    gon.fb_app_id = ENV['FB_APP_ID']

    imgs = {}
    Dir.chdir("#{Rails.root}/app/assets/images/game-images") do
      imgs = Dir["**"].inject({}) {|h,f| h.merge! f => view_context.image_url('game-images/' + f)}
    end

    gon.imgs = imgs

    @attending = @graph.get_connections(gon.eventid, 'attending')

  end
end

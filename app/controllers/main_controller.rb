class MainController < ApplicationController
  include MainHelper
  def index
    require 'koala'

    Koala.config.api_version = 'v2.0'

    if current_user
      gon.uid = current_user.uid
    end

    @graph = Koala::Facebook::API.new('CAADZCZAhnZAX9sBAOB2ZADLrZCgnfG0fsY5DpQO05ycgRdOmPXYoJyjPIEx5FSBsQpCeRjigHjDD4drNzOz8IDJTQlL9uPjvmkKPlUY7vpeqHYNqj1syB5krUHQPEgQPjmZBP8BCEQiQVyIWOXSNj8IPBbk07P8IjKpiFco6HFFAyu1qD5VPUN6bEBYFZA2pmgZD')

    event = @graph.get_object('404406766364958')

    gon.eventtime = event['start_time']
    gon.eventid = event['id']

    @attending = @graph.get_connections(gon.eventid, 'attending')



  end

end

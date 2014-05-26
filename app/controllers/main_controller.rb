class MainController < ApplicationController
  def index
    require 'koala'

    Koala.config.api_version = "v2.0"

    @graph = Koala::Facebook::API.new("CAACEdEose0cBAGsGKwAy4XfgfqXwJqXTHVHj6X1ZCtpUXcGBENZAr7ArCINobPxWIZAPP1TkiYesWvyMcKOegbAr53oivMlTuCAZBG7J7KcsiWWAbiPkZBizm10zuBcHHMGQRB7GL60PRPWPb0dJO2zdYDTqoEUruRcUQBDaTiZANLXB77BT21yZCfgOfVsmkX9oXKanGzSOgZDZD")

    #profile = @graph.get_object("me")

    #@name = profile.name


  end
end

class TournamentsController < ApplicationController
  def show
    @tournament = Tournament.find(params[:id])
  end

  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    Tournament.create(params)
  end

  def transfer

    redirect_to root_path
  end
end

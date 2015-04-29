class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new
    @user.name = params[:user]["name"]

    @user.save

    redirect_to @user
  end

  def new

  end

  def show
    @suggestions = User.all

    respond_to do |format|
      format.html { render json: @suggestions.map { |team| {:name => team.name, :uid => team.uid} }}
      format.json { render json: @suggestions.map { |user| {:name => user.name,:id => user.id, :uid => user.uid} }}
    end
  end

  private
  def article_params
    params.require(:users).permit(:name)
  end
end

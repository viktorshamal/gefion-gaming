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
    @user = User.find(params[:id])
  end

  private
  def article_params
    params.require(:users).permit(:name)
  end
end

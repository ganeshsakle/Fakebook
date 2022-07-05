class StaticPageController < ApplicationController
  def new
  end

  def index
    @users = User.all
    @friends=Friend.all
  end

  def show
    @user = User.find(params[:id])
  end
end

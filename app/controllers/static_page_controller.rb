class StaticPageController < ApplicationController
  def new
  end

  def index
    @users = User.page params[:page]
   # @friends=Friend.all
    @notifications = Notification.all
  end

  def show
    @user = User.find(params[:id])
  end
end

class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all
  end

  def new
  end

  def create
    @userid= User.find(params[:id])
    @notification = Notification.new(user_id: @userid.id, friend_id: current_user.id)
    if @notification.save
      flash[:success]="Request sent!"
      redirect_to friends_path
    end
  end

  def update
    @userid= User.find(params[:id])
    @notification = Notification.new(user_id: @userid.id, friend_id: current_user.id)
    if @notification.save
      flash[:success]="Request sent!"
      redirect_to friends_path
    end
  end

  def edit
  end

  def destroy
  end
end

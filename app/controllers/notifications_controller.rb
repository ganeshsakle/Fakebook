class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all
    @users = User.all
  end

  def show
    @notifications = current_user.notifications.all
  end

  def create
    @user = User.find(params[:id])
    @notification = Notification.new(user_id: @user.id, requestor: current_user.id)
    if @notification.save && @notification.reload
      redirect_to static_page_index_path , notice: "request sent!"
    else
      redirect_to static_page_index_path, notice: "request Already sent!."
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to notifications_path
  end
end

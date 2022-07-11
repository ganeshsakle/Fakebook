class NotificationsController < ApplicationController
  def index
    @notifications = Notification.page params[:page]
  end

  # def show
  #   @notifications = current_user.notifications.all
  # end

  def create
    @user = User.find(params[:id])
    if current_user.id != @user.id
      @notification = Notification.new(user_id: @user.id, requestor_id: current_user.id)
      if @notification.save
        flash[:success] = "request sent!"
        redirect_to static_page_index_path
      else
        flash[:notice]= "request already sent."
        redirect_to static_page_index_path
      end
    else
      flash[:warn] = "request can't sent."
      redirect_to static_page_index_path
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to notifications_path
  end
end

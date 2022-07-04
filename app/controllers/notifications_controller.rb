class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all
  end

  def new
  end

  def show
    @notifications = current_user.notifications.all
  end

  def create
    @user = User.find(params[:id])
    @notification = @user.notifications.new(user_id: @user.id, requestor: current_user.id)
    # @notification2 = current_user.notifications.new(user_id: current_user, requestor: @user.id)
    if @notification.save #and  @notification2.save
      redirect_to static_page_index_path , notice: "request sent!"
    else
      redirect_to static_page_index_path, notice: "request Already sent!."
    end
    @user.reload
  end

  def update
    # @user= User.find(params[:id])
    # @notification = Notification.new(user_id: @user.id, friend_id: current_user.id)
    # if @notification.save
    #   flash[:success]="Request sent!"
    #   redirect_to friends_path
    # end
  end

  def edit
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    @user.reload
    redirect_to notifications_path
  end

  # private 
  #   def notification_params
  #     params.require(:notification).permit(:user_id, :friend_id => nil, :requestor)
  #   end 
end

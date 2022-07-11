class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends =Friend.all
    @friend_count  = 0
  end

  def destroy
    @friend = Friend.find(params[:id])       # Friend.find(params[:id])
    @friend.delete
    flash[:success]="unfriend!"
    redirect_to friends_path
  end

  def create
    @user = User.find(params[:id])
    @notification = Notification.find(params[:not_id])
    if @user.id == current_user.id
      redirect_to friends_path, notice: "some error occured"
    else
      current_user.friends.create(user_id: current_user.id, friend_id: @user.id)
      @notification.delete
      redirect_to friends_path, notice: "Request accepted successfully."
    end
  end
end

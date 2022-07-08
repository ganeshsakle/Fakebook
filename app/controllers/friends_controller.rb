class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend, only: %i[update destroy]

  def new
    @friend = Friend.new(params[:user_id])
  end

  def index
    @friends =Friend.all
    @friend_count  = 0
  end

  def update
  end

  def destroy
    @friend = set_friend          # Friend.find(params[:id])
    @friend.delete
    flash[:success]="unfriend!"
    redirect_to friends_path
  end

  def create
    @user = User.find(params[:id])
   # byebug
    if @user.id == current_user.id
      redirect_to friends_path, notice: @friend.errors.full_messages.first
    else
      current_user.friends.create(user_id: @user.id, friendid: current_user.id)
      redirect_to friends_path
    end
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end
end

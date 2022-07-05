class FriendsController < ApplicationController
  before_action :authenticate_user!
  def new
    @friend = Friend.new(params[:user_id])
  end

  def edit
  end

  def index
    @friends=Friend.all
    @friend_count  = 0
  end

  def save
  end

  def update
    @friend =Friend.new(params[:id]) 
    if @friend.save
      flash[:success]="unfriend!"
      redirect_to friends_path
    else
      redirect_to friends_path, notice: @friend.errors.full_messages.first
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.delete
    flash[:success]="unfriend!"
    redirect_to friends_path
  end

  def create
    @user = User.find(params[:id])
    @friend = Friend.new(user_id: @user.id, friendid: current_user.id) 
    if @friend.save
      redirect_to friends_path
    else
      redirect_to friends_path, notice: @friend.errors.full_messages.first
    end
  end
end

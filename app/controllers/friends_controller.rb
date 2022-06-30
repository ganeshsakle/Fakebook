class FriendsController < ApplicationController
  before_action :authenticate_user!
  def new
    @friend = Friend.new(params[:user_id])
  end

  def edit
  end

  def index
    @friends=Friend.all
    if !current_user
      redirect_to static_page_new_path
    end
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

  def notifications
    @friend =Friend.new(params[:user_id]) 
    if @friend.save
      flash[:success]="Request sent!"
      redirect_to users_path
    end
  end

  def create
    @friend = Friend.new(user_id: current_user.id) 
    if @friend.save
      flash[:success]="Request sent!"
      redirect_to friends_path
    else
      redirect_to friends_path, notice: @friend.errors.full_messages.first
    end
  end
end

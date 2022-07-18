# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = Notification.page params[:page]
  end

  def create
    @user = User.find(params[:id])
    if current_user.id != @user.id
      @notification = Notification.new(user_id: @user.id, requestor_id: current_user.id)
      if @notification.save
        flash[:success] = 'request sent!'
      else
        flash[:notice] = 'request already sent.'
      end
    else
      flash[:warn] = "request can't sent."
    end
    redirect_to users_path
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to notifications_path
  end
end

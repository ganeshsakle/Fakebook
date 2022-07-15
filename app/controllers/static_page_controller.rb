# frozen_string_literal: true

class StaticPageController < ApplicationController
  def new; end

  def index
    @users = User.page params[:page]
    @notifications = Notification.all
  end

  def show
    @user = User.find(params[:id])
  end
end

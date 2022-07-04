class StaticPageController < ApplicationController
  def new
  end

  def index
    @users = User.all
    @friends=Friend.all
  end
end

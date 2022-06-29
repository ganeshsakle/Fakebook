class StaticPageController < ApplicationController
  def new
  end

  def index
    @users = User.all
  end
end

# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    @post = like.post
    like.save
    redirect_back(fallback_location: posts_path)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_back(fallback_location: posts_path)
  end
end

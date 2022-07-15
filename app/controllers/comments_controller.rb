# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.update(user_id: current_user.id)
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body, user_id: current_user.id)
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def index
    @comments = Comment.all
  end
 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to root_path
  end

  def edit
  end

  def save
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new(params[:content])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
    @friends = Friend.all
  end

  def create
    @post = Post.new(post_params) 
    @post.user_id = current_user.id
    if @post.save
      flash[:success]="Post created"
      redirect_to root_path
    else
      redirect_to new_post_path, notice: @post.errors.full_messages.first
    end
  end

  def save
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:success]="Post Updated"
        redirect_to root_path
      else
        redirect_to edit_post_path, notice: @post.errors.full_messages.first
      end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success]="Post deleted successfully!"
      redirect_to posts_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def like
    @post = Post.find(params[:id])
    # byebug
    @post.like.new(post_id: @post.id, user_id: current_user.id)
    if @post.save!
      redirect_to root_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end

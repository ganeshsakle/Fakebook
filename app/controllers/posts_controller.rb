class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new(params[:content])
  end

  def edit
  end

  def index
    @posts = Post.all
    if !current_user
      redirect_to static_page_new_path
    end
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
  end

  def destroy
  end

  def show
    @posts =Post.all
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end

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
    @post = Post.new(params[:content])
    if @post.save
      flash[:success]="Post created"
    end
  end

  def save
  end

  def update
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:content, :like)
    end
end

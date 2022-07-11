class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new(params[:content])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all #.with_attached_images
    @friends = Friend.all
  end

  def create
    @post = Post.new(post_params) 
    @post.image.attach(params[:post][:image])
    @post.user_id = current_user.id
    # @post.images.attach(params[:post][:images])
    #byebug
    if @post.save
      flash[:success]="Post created"
      redirect_to root_path
    else
      redirect_to new_post_path, notice: @post.errors.full_messages.first
    end
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:success]="Post Updated"
        redirect_to root_path
      else
        flash[:error] = @post.errors.full_messages.first
        redirect_to edit_post_path
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
    @post_count=0
  end

  private
    def post_params
      params.require(:post).permit(:content, :image)
    end
end

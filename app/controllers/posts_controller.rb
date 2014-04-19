class PostsController < ApplicationController
  def index
     @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "YES, it worked!"
      redirect_to post_path(@post)
    else 
      flash[:error] = "BOO, it failed!"
      redirect_to new_post_path
    end  
  end
  
  
  def edit
     @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "YES, it worked!"
      redirect_to post_path(@post)
    else 
   #   redirect_to new_post_path
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
 
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :author)
  end

end






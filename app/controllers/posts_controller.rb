class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create
                                    ]
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

  def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "YES, it worked!"
      redirect_to post_path(@post)
    else 
      flash[:success] = "BOO, it failed!"
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted."
    redirect_to posts_path
  end
  
  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :author)
  end

end






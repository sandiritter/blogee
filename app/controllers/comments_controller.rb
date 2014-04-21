class CommentsController < ApplicationController
  before_action :set_post
  
  def index
    @comments = Comment.new
  end
    
  def new
    @comment = @post.comments.build
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment has been saved."
      redirect_to post_path(@post)
    else 
      flash[:error] = "Comment has not been saved."
      #redirect_to post_comment_path(@comment)
      render "new"
    end  
  end
  
  def show
  end
  
  
  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :author)
  end
  
 
  def set_post
     @post = Post.find(params[:post_id])
 end


end

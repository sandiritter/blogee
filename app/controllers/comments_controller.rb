class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  
    
  def new
    @comment = @post.comments.build
  end
  
  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment has been saved."
      redirect_to post_path(@post)
      #redirect_to [@post, @comment]
    else 
      flash[:error] = "Comment has not been saved."
      #redirect_to edit_post_path(@post)
      render "new"
    end  
  end
  
  def index
    @comments = Comment.new
  end
  
  def show
  end
  
  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment has been updated."
      redirect_to [@post, @comment]
   else
      flash[:alert] = "Comment has not been updated."
      # render action: "edit"
      redirect_to edit_post_path(@post)
   end
  end
  
  def destroy
    @comment.destroy
    flash[:notice] = "Comment has been deleted."
    redirect_to @post
  end

  def edit
   # @comment = Comment.find(params[:id])
   # edit_post_comment_path(@post, @comment)
  end
  
  
  
  private

  def find_comment
    @comment = Comment.find(params[comment:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :author)
  end
  
 
  def set_post
     @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end


end

class CommentsController < ApplicationController
  
  def new 
    if request.url =~ /(post)\w/
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    else
      @snippet = Snippet.find(params[:snippet_id])
      @comment = @snippet.comments.new
    end
  end
  
  def create
    if request.url =~ /(post)\w/
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(comment_params)
      
      if @comment.save
      redirect_to @post
      else
      render :new
      end
      
    elsif request.url =~ /(snippet)\w/
      @snippet = Snippet.find(params[:snippet_id])
      @comment = @snippet.comments.new(comment_params)
      if @comment.save
        redirect_to @snippet
      else
        render :new
      end
    else
      redirect_to homepage_path
      
    end
  end
  
  
private
  
  def comment_params
    params.require(:comment).permit(:comment, :post_id, :snippet_id)
  end
  
  
  
end

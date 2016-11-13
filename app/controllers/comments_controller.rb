class CommentsController < ApplicationController
  
  def create
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.create(comment_params)
    flash[:notice] = 'You have successfully posted a comment'
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'You have successfully deleted a comment'
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end

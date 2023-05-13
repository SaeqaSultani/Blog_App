class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comments = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to user_post_path(author_id: params[:author_id], id: params[:post_id])
    else
      flash[:alert] = 'Error occur during add Comment!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @user = @post.author
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to user_post_path(@user, @post), notice: 'Comment deleted successfully .' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end

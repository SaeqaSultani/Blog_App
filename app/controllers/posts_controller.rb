class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    # @posts = @user.posts
    @posts = @user.posts.includes(:author)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    # @comments = @post.comments
    # @comments = @post.comments.includes(:post)
    @comments = @post.comments.includes(:author)
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(author: @user, title: params[:post][:title], text: params[:post][:text])
    if @post.save

      # redirect_to user_post_path(@user, @post)
      redirect_to user_posts_path(@user.id)

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path(current_user, @post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post Deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

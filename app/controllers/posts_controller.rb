class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    user = User.find(params[:post][:user_id])
    @post = user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(user)
    else
      render :new
    end

    def show
      # @post = Post.find(params[:id])
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end

class PostsController < ApplicationController

  def new
    @post = Post.new
    @tags = Tag.all.map { |tag| tag.name }
  end

  def create
    user = User.find(params[:post][:user_id])
    @post = user.posts.new(post_params)

    if @post.save
      redirect_to user_posts_path(user)
    else
      render :new
    end
  end

    def show
      @post = Post.find(params[:id])
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      @post.update_attributes(post_params)

      redirect_to user_post_path(@post.user, @post)
    end

    def destroy
      post = Post.find(params[:id])
      post.delete
      redirect_to user_posts_path(current_user)
    end


  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :tag_list)
  end

end

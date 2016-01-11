class Admin::PostsController < Admin::BaseController

  def show

  end

  def index
    @posts = Post.all
    @user = current_user
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :tag_list, :slug)
  end

end

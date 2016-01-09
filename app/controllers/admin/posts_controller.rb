class Admin::PostsController < Admin::BaseController

  def show

  end

  def index
    @posts = Post.all
    @user = current_user
  end

end

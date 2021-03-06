class ApplicationController < ActionController::Base
  helper_method :current_user, :post_tags
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def post_tags
    tag = Post.find_by_slug(params[:slug]).tags
    tag.empty? ? (tag = "None") : (tag = tag.first[:name].upcase)
    tag
  end

end

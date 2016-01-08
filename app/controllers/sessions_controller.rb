class SessionsController < ActionController::Base
  layout "sessions_layout"
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end

class UsersController < ApplicationController

  def new
    session.clear
    @user = User.new
  end

  def show

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :slug)
  end

end

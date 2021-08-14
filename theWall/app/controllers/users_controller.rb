class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:notice] = ['User successfully created']
    else
      flash[:notice] = ['User not created']
    end

    session[:username] = @user.username
    redirect_to message_new_path
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end

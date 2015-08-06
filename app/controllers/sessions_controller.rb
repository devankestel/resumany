class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_email_param)
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render inline: "failed login"      
      #render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def user_email_param
    params.require(:user).permit(:email)
  end

  def user_password_param
    params.require(:user).permit(:password)
  end

end

#&& @user.authenticate(params[:password])
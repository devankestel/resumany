class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_email_param)
    user_password_param = params.require(:user).permit(:password)
    if @user && @user.authenticate(user_password_param[:password])
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



end

#&& @user.authenticate(params[:password])
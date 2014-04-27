class SessionsController < ApplicationController

  def create
    @user = User.where(username: params[:session][:username].downcase).first
    @user ||= User.where(email: params[:session][:username].downcase).first
    
    if @user && @user.authenticate(params[:session][:password])
      session[:username] = @user.username
      flash[:success] = "Welcome #{@user.username}"
      redirect_to session[:redirect] || root_path
    else
      flash[:alert] = "Login error"
      redirect_to login_path
    end
  end
    

end

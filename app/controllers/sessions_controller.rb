class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "logged in successfully"
    else
      flash[:error] = "There was a problem logging you in"
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully signed out"
    redirect_to root_path
  end
end

# This controller handles the login/logout function of the site.
class SessionsController < ApplicationController
  skip_before_action :login_required?
 layout "login"
  def new

  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end



end

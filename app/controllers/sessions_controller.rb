class SessionsController < ApplicationController

  def index
  end

  def login
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:id] = user.id
      session[:firstname]= user.first_name
      session[:lastname] = user.last_name
      session[:city] = user.city
      session[:email] = user.email
      redirect_to '/dashboard'
    else
      flash[:login_error]= "user not found and/or password doesn't match"
      redirect_to ''
    end
  end


end

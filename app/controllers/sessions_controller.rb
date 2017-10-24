class SessionsController < ApplicationController
  def index
  end


  def login
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:id] = user.id
      session[:firstname]= user.firstname
      session[:lastname] = user.lastname
      session[:location] = user.location
      session[:email] = user.email
      redirect_to '/main'
    else 
      flash[:login_error]= "user not found and/or password doesn't match"
      redirect_to ''
    end
  end


end

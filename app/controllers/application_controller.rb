class ApplicationController < ActionController::Base
<<<<<<< HEAD
  protect_from_forgery with: :exception

  require 'date'
=======
    protect_from_forgery with: :exception

    def current_user
        User.find(session[:id]) if session[:id]
    end
    helper_method :current_user

>>>>>>> 8ae9bd623db9e730465eb8a1d05ec78bad4c2d62
end

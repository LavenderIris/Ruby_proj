class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_login

    def current_user
        User.find(session[:id]) if session[:id]
    end
    helper_method :current_user

    private
    def require_login
        unless session[:id]
            redirect_to '/'
        end
    end

end

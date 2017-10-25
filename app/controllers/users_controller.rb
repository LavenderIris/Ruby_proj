class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
            flash[:success] = "You have successfully registered. Please login."
        else
            flash[:errors]=user.errors.full_messages
        end
        redirect_to ''
    end

    def main
        render 'users/main.html.erb'
    end

    def show
        @user = User.find(params[:id])
    end

    def show_dashboard
        @friends = User.find(session[:id]).friends

        render 'users/main.html.erb'
    end

    private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :location, :password)
    end
end

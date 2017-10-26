class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
            redirect_to '/users/dashboard'
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
        @friend = User.find(params[:id])
        @isfriend =  current_user.friends.where(first_name:@friend.first_name).where(last_name: @friend.last_name)
        # binding.pry
    end

    def show_dashboard
        @friends = User.find(session[:id]).friends

        render 'users/main.html.erb'
    end

    def find_friend

        fn = ""
        ln = ""
        str = params[:name].split(" ")
        if str.size == 2
            fn = str[0]
            ln = str[1]
        elsif str.size > 2
            fn = str[0]
            ln = str[str.length-1]
        end

        @friend = User.find_by_first_name_and_last_name(fn, ln)


        if @friend.nil?
            flash[:error] = "User not found"
            redirect_to '/dashboard'
        else
            puts "success!"
            # success!
            puts "ID", @friend.id
         
            redirect_to '/users/' + @friend.id.to_s
        end

    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :city, :password)
    end
end

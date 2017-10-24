class FriendsController < ApplicationController

    def create
        @friends = Friendship.new(user:current_user,friend:User.find(params[:id]))
        if @friends.save
            redirect_to '/users/'+params[:id]
        else
            flash[:error] = ['Oops, something went wrong, please try again']
            redirect_to '/users/'+params[:id]
        end
    end

    def destroy
        @friends = Friendship.where(user_id:current_user.id,friend_id:params[:id]).take
        @friends.delete
        @friends.save
        redirect_to '/users/'+params[:id]
    end
end

class WishController < ApplicationController

    def create
        @band = Band.find(params[:id])
        unless @band.user_wishes.include?(current_user)
            @band.user_wishes << current_user
            redirect_to '/bands/'+params[:id]
        else
            flash[:error] = ['Oops, something went wrong, please try again']
            redirect_to '/bands/'+params[:id]
        end
    end

    def destroy
        @band = Band.find(params[:id])
        if @band.user_wishes.include?(current_user)
            @band.user_wishes.delete(current_user)
            redirect_to '/bands/'+params[:id]
        else
            redirect_to '/bands/'+params[:id]
        end
    end
end

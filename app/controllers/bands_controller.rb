class BandsController < ApplicationController

    def index
        @bands = Band.all
    end

    def new

        if Band.where(name:params[:band]).empty?
            @response = HTTParty.get("https://ws.audioscrobbler.com/2.0/", :query => {:method => "artist.search", :artist => params[:band], :limit => "1", :api_key => "ba268e660cd43a240846b8eec02b92f9", :format => "json"})
            @response=JSON.parse(@response.body)
            @band = Band.new(name:params[:band],mb_id:@response["results"]["artistmatches"]["artist"][0]["mbid"])

            @response = HTTParty.get("https://ws.audioscrobbler.com/2.0/", :query => {:method => "artist.gettoptags", :artist => params[:band], :mbid => "#{@band.mb_id}", :api_key => "ba268e660cd43a240846b8eec02b92f9", :format => "json"})
            @response=JSON.parse(@response.body)
            @tag = @response["toptags"]["tag"][0]["name"]
            @band["tag"] = @tag

            @response = HTTParty.get("https://ws.audioscrobbler.com/2.0/", :query => {:method => "tag.gettopartists", :tag => "#{@band.tag}", :api_key => "ba268e660cd43a240846b8eec02b92f9", :limit => "5", :format => "json"})
            @similars = JSON.parse(@response.body)
            @band["similar"] = @similars

            if @band.save
                redirect_to '/bands'
            else
                flash[:errors] = ["Oops, something went wrong"]
                redirect_to '/bands'
            end
        else
            @band = Band.where(name:params[:band]).take
            redirect_to '/bands/'+@band.id
        end
    end

    def show
        @band = Band.find(params[:id])
        @similar = @band.similar["topartists"]["artist"]
        @concerts = Concert.where(band:@band)
    end
end

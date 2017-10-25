class BandsController < ApplicationController

    def index
        @bands = Band.all
    end

    def new
        @searchIn = params.require("band").permit("search")
        @searchIn = @searchIn["search"]
        # @response = HTTParty.get("https://ws.audioscrobbler.com/2.0/", :query => {:method => "artist.getTopTags", :artist => @searchIn, :api_key => "ba268e660cd43a240846b8eec02b92f9", :format => "json"})
        # @similars = JSON.parse(@response.body)
        @response = HTTParty.get("https://ws.audioscrobbler.com/2.0/", :query => {:method => "tag.gettopartists", :tag => "indie", :api_key => "ba268e660cd43a240846b8eec02b92f9", :format => "json"})
        @similars = JSON.parse(@response.body)
        binding.pry
        puts @similars
    end
    # @response = HTTParty.get("https://ws.audioscrobbler.com/2.0/", :query => { :method => "artist.getsimilar", :artist => "madonna", :api_key => "ba268e660cd43a240846b8eec02b92f9", :limit => "5", :format => "json"})
end

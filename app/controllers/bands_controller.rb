class BandsController < ApplicationController

    def index
        artist = "Bruno Mars"
        cityname = "Boston"
        date = "08-10-2017"
        # response = HTTParty.get("https://api.setlist.fm/rest/1.0/search/setlists",:query => { :artistName => "Coldplay", :cityName => "Santa Clara", :date => "04-10-2017" },:headers => { "x-api-key" => "1128bdd4-2942-4334-b4fa-5cf725b57260","Accept" => "application/json" })
        response = HTTParty.get("https://api.setlist.fm/rest/1.0/search/setlists",:query => { :artistName => artist, :cityName => cityname , :date => date },:headers => { "x-api-key" => "1128bdd4-2942-4334-b4fa-5cf725b57260","Accept" => "application/json" })
    
        # binding.pry
        testvar = JSON.parse(response.body)
    
        @longitude = testvar["setlist"][0]["venue"]["city"]["coords"]["long"]
        @lat = testvar["setlist"][0]["venue"]["city"]["coords"]["lat"]
        @songlist = testvar["setlist"][0]["sets"]["set"]
        @bandname = testvar["setlist"][0]["artist"]["name"]
        @venue = testvar["setlist"][0]["venue"]
        @venuename = testvar["setlist"][0]["venue"]["name"]
        @venuelocation = testvar["setlist"][0]["venue"]["city"]["name"]
        @venuestate = testvar["setlist"][0]["venue"]["city"]["state"]
        t = testvar["setlist"][0]["eventDate"]
        cdate = Date.strptime(t, "%d-%m-%Y" )
        @eventdate = cdate.strftime("%A, %B %d %Y")
    end

    def new
        unless Band.where(name:params[:band])
            @response = HTTParty.get("https://ws.audioscrobbler.com/2.0/", :query => {:method => "artist.search", :artist => params[:band], :limit => "1", :api_key => "ba268e660cd43a240846b8eec02b92f9", :format => "json"})

            @band = Band.new(name:params[:band],mb_id:@response["results"]["artistmatches"]["artist"][0]["mbid"])

            @response = HTTParty.get("https://ws.audioscrobbler.com/2.0/", :query => {:method => "artist.gettags", :mbid => @band["mb_id"], :api_key => "ba268e660cd43a240846b8eec02b92f9", :format => "json"})

            @tag = @response["tags"]["tag"][0]["name"]
            @band["tag"] = @tag

            @response = HTTParty.get("https://ws.audioscrobbler.com/2.0/", :query => {:method => "tag.gettopartists", :tag => @band["tag"], :api_key => "ba268e660cd43a240846b8eec02b92f9", :limit => "5", :format => "json"})

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
        @similar = @band.similar["topartists"]
        @concerts = Concert.where(band:@band)
    end
end

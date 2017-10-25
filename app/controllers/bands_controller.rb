class BandsController < ApplicationController

  def index
    response = HTTParty.get("https://api.setlist.fm/rest/1.0/search/setlists",:query => { :artistName => "Coldplay", :cityName => "Santa Clara", :date => "04-10-2017" },:headers => { "x-api-key" => "1128bdd4-2942-4334-b4fa-5cf725b57260","Accept" => "application/json" })
    # binding.pry
    testvar = JSON.parse(response.body)

    # binding.pry
    @songlist = testvar["setlist"][0]["sets"]["set"]
    @bandname = testvar["setlist"][0]["artist"]["name"]
    @venue = testvar["setlist"][0]["venue"]
    @venuename = testvar["setlist"][0]["venue"]["name"]
    @venuelocation = testvar["setlist"][0]["venue"]["city"]["name"]
    @venuestate = testvar["setlist"][0]["venue"]["city"]["state"]
    @eventdate = testvar["setlist"][0]["eventDate"]

    @long = venue["city"]["coords"]["long"]
    @lat = venue["city"]["coords"]["lat"]
  end

  def new
      response.body = HTTParty.get("https://ws.audioscrobbler.com/2.0/",:query => { :method => "artist.getsimilar", :mbid => "95e1ead9-4d31-4808-a7ac-32c3614c116b", :api_key => "ba268e660cd43a240846b8eec02b92f9", :limit => "5", :format => "json"}, :headers => {:raw => "true"} )
      puts response
  end

end

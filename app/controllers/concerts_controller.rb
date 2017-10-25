class ConcertsController < ApplicationController
    require 'date'
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
end
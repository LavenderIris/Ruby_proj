require 'json'
require 'httparty'
#
# conn = Faraday.new(:url => 'http://api.setlist.fm/docs/1.0')
# response = conn.get '/search/setlists', { :artistsName => 'Coldplay'}
# puts response.body
#

# response = HTTParty.get("https://api.setlist.fm/rest/1.0/search/setlists",:query => { :artistName => "Coldplay", :cityName => "Santa Clara", :date => "04-10-2017" },:headers => { "x-api-key" => "1128bdd4-2942-4334-b4fa-5cf725b57260","Accept" => "application/json" })
# testvar = JSON.parse(response.body)
testvar = {"id"=>"3be3a8d4", "versionId"=>"7b40ee4c", "eventDate"=>"04-10-2017", "lastUpdated"=>"2017-10-07T13:34:40.000+0000", "artist"=>{"mbid"=>"cc197bad-dc9c-440d-a5b5-d52ba2e14234", "tmid"=>806431, "name"=>"Coldplay", "sortName"=>"Coldplay", "disambiguation"=>"", "url"=>"https://www.setlist.fm/setlists/coldplay-3d6bde3.html"}, "venue"=>{"id"=>"63d4564f", "name"=>"Levi's Stadium", "city"=>{"id"=>"5393015", "name"=>"Santa Clara", "state"=>"California", "stateCode"=>"CA", "coords"=>{"lat"=>37.354108, "long"=>-121.9552356}, "country"=>{"code"=>"US", "name"=>"United States"}}, "url"=>"https://www.setlist.fm/venue/levis-stadium-santa-clara-ca-usa-63d4564f.html"}, "tour"=>{"name"=>"A Head Full of Dreams"}, "sets"=>{"set"=>[{"song"=>[{"name"=>"O mio babbino caro", "tape"=>true, "cover"=>{"mbid"=>"9dee40b2-25ad-404c-9c9a-139feffd4b57", "name"=>"Maria Callas", "sortName"=>"Callas, Maria", "disambiguation"=>"", "url"=>"https://www.setlist.fm/setlists/maria-callas-33d6706d.html"}}, {"name"=>"A Head Full of Dreams", "info"=>"extended intro with Charlie Chaplin speech"}, {"name"=>"Yellow"}, {"name"=>"Every Teardrop Is a Waterfall"}, {"name"=>"The Scientist"}, {"name"=>"God Put a Smile Upon Your Face", "info"=>"with \"Oceans\" excerpt in intro"}, {"name"=>"Paradise", "info"=>"with Tiësto Remix outro"}]}, {"name"=>"B-Stage", "song"=>[{"name"=>"Always in My Head"}, {"name"=>"Magic"}, {"name"=>"Everglow", "info"=>"dedicated to Tom Petty and victims of recent disasters"}]}, {"name"=>"A-Stage", "song"=>[{"name"=>"Clocks", "info"=>"with \"Army of One\" excerpt in intro"}, {"name"=>"Midnight", "info"=>"partial"}, {"name"=>"Charlie Brown", "info"=>"restarted with Chris asking the crowd to turn off their phones for this song"}, {"name"=>"Hymn for the Weekend"}, {"name"=>"Fix You", "info"=>"with \"Midnight\" excerpt in intro"}, {"name"=>"Viva la Vida"}, {"name"=>"Adventure of a Lifetime"}]}, {"name"=>"C-Stage", "song"=>[{"name"=>"Kaleidoscope", "tape"=>true, "info"=>"extended"}, {"name"=>"In My Place", "info"=>"acoustic, with a snippet of Tom Petty's \"Free Falling.\""}, {"name"=>"Don't Panic", "info"=>"acoustic; Will on lead vocals"}, {"name"=>"O", "info"=>"with fan from audience called Rece on piano"}]}, {"name"=>"A-Stage", "song"=>[{"name"=>"Something Just Like This", "cover"=>{"mbid"=>"2c82c087-8300-488e-b1e4-0b02b789eb18", "name"=>"The Chainsmokers & Coldplay", "sortName"=>"Chainsmokers, The & Coldplay", "url"=>"https://www.setlist.fm/setlists/the-chainsmokers-and-coldplay-33ce5029.html"}}, {"name"=>"A Sky Full of Stars"}, {"name"=>"Up&Up", "info"=>"extended outro"}]}]}, "info"=>"The band violated the town mid week curfew, playing well past 10 PM.", "url"=>"https://www.setlist.fm/setlist/coldplay/2017/levis-stadium-santa-clara-ca-3be3a8d4.html"}
concert = testvar
sets = concert["sets"]
sets["set"].each do |s|
    puts s["name"]
    s["song"].each do |s2|
        puts s2["name"]
    end
end

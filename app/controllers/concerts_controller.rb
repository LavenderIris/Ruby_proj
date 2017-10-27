class ConcertsController < ApplicationController
    require 'date'
    def index

        artist = params[:artist]
        cityname = params[:city]
        tempdate = params[:date].split('-')
        date = tempdate[2]+'-'+tempdate[1]+'-2017'

        response = HTTParty.get("https://api.setlist.fm/rest/1.0/search/setlists",:query => { :artistName => artist, :cityName => cityname , :date => date },:headers => { "x-api-key" => "1128bdd4-2942-4334-b4fa-5cf725b57260","Accept" => "application/json" })
        puts response.body
      

        if response["code"].eql? 404
            @concert = Concert.find_by(band:Band.find_by(name:params[:artist]), city:params[:city], date:params[:date])
            # binding.pry
            unless @concert.nil?
                @concert
                render 'info.html.erb'
            else
                redirect_to '/concerts/new'
            end
            # flash[:error] = "Event not found"
            # redirect_to '/dashboard'
        else
            testvar = JSON.parse(response.body)

            b = Band.find_by(name: params[:artist])
            if b.nil?
                b = Band.create(name:params[artist])
                c = Concert.new(band: b, city:testvar["setlist"][0]["venue"]["city"]["name"], date: params[:date], user: current_user, venue:testvar["setlist"][0]["venue"]["name"], state:testvar["setlist"][0]["venue"]["city"]["state"]) 
                if c.valid?
                    c.save
                end
            else 
                c = Concert.find_by(band: b, date:params[:date], city:params[:city])
                if c.nil?
                    c = Concert.new(band: b, city:testvar["setlist"][0]["venue"]["city"]["name"], date: params[:date], user: current_user, venue:testvar["setlist"][0]["venue"]["name"], state:testvar["setlist"][0]["venue"]["city"]["state"]) 
                    if c.valid?
                        c.save
                    end
                end 
            end
    
            @longitude = testvar["setlist"][0]["venue"]["city"]["coords"]["long"]
            @lat = testvar["setlist"][0]["venue"]["city"]["coords"]["lat"]
            @songlist = testvar["setlist"][0]["sets"]["set"]
            @bandname = testvar["setlist"][0]["artist"]["name"]
            @venuename = testvar["setlist"][0]["venue"]["name"]
            @venuecity = testvar["setlist"][0]["venue"]["city"]["name"]
            @venuestate = testvar["setlist"][0]["venue"]["city"]["state"]
            t = testvar["setlist"][0]["eventDate"]
            cdate = Date.strptime(t, "%d-%m-%Y" )
            @eventdate = cdate.strftime("%A, %B %d %Y")

            render '/concerts/index.html.erb'
        end
    
    end

    def new
    end

    def show_page
        @concert = Concert.find(params[:id])
        artist = @concert.band.name
        cityname = @concert.city
        tempdate = @concert.date.to_s.split('-')
    

        date = tempdate[2]+'-'+tempdate[1]+'-2017'

        response = HTTParty.get("https://api.setlist.fm/rest/1.0/search/setlists",:query => { :artistName => artist, :cityName => cityname , :date => date },:headers => { "x-api-key" => "1128bdd4-2942-4334-b4fa-5cf725b57260","Accept" => "application/json" })
        
        if response["code"].eql? 404
            @concert
            render 'info.html.erb'
            
        else
            testvar = JSON.parse(response.body)

            @longitude = testvar["setlist"][0]["venue"]["city"]["coords"]["long"]
            @lat = testvar["setlist"][0]["venue"]["city"]["coords"]["lat"]
            @songlist = testvar["setlist"][0]["sets"]["set"]
            @bandname = testvar["setlist"][0]["artist"]["name"]
            @venuename = testvar["setlist"][0]["venue"]["name"]
            @venuecity = testvar["setlist"][0]["venue"]["city"]["name"]
            @venuestate = testvar["setlist"][0]["venue"]["city"]["state"]
            t = testvar["setlist"][0]["eventDate"]
            cdate = Date.strptime(t, "%d-%m-%Y" )
            @eventdate = cdate.strftime("%A, %B %d %Y")

            render '/concerts/index.html.erb'
        end

    end

    def create
        band = Band.new(name:params[:band])
        if band.valid?
            band.save
        else
            band = Band.find_by(name:params[:band])
        end
        concert = Concert.new(date:params[:date], venue:params[:venue], city:params[:city], state:params[:state], band:band, user_id:session[:id])
        if concert.valid?
            concert.save
            flash[:errors] = ["concert saved successfully"]
        else
            flash[:errors] = concert.errors.full_messages
        end
        redirect_to '/concerts/new'
    end

    def show
    end

    def attended
        band = Band.new(name:params[:band])
        if band.valid?
            band.save
        else
            band = Band.find_by(name:params[:band])
        end
        concert = Concert.new(date:params[:date], venue:params[:venue], city:params[:city], state:params[:state], band:band, user_id:session[:id])
        if concert.valid?
            concert.save
        else
            concert = Concert.find_by(date:params[:date], venue:params[:venue], city:params[:city], state:params[:state], band:band)
        end
        Attend.create(user_id:session[:id], concert:concert)
        redirect_to '/dashboard'
    end

    def all
        @concerts = Concert.all
        render 'all.html.erb'
    end
end

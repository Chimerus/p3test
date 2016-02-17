require 'twilio-ruby' 
class LocationsController < ApplicationController

  def index
  end

  def show
    @location = Location.find(params[:id])
    @time = params[:time]
  end 

  def new
  end

  def edit
     @location = Location.find(params[:id])
     @time = params[:time]
  end

  def delete
  end

  def create
    # zach
    # loc_params = location_params.clone
    # loc_params[:longitude] = loc_params[:longitude].to_f
    # loc_params[:latitude] = loc_params[:latitude].to_f
    # @location = Location.new(loc_params)
    @location = Location.find(params[:id])
    # stop them from entering invalid address!
    key = ENV['MAPS_KEY']
    # origin_query = HTTParty.post('https://www.googleapis.com/geolocation/v1/geolocate?key='+key)
    # parsed_response = JSON.parse(origin_query.body)["location"]
    # origin = loc_params[:latitude].to_s+","+loc_params[:longitude].to_s
    origin = "40.7400337,-73.9895989"
    response = HTTParty.get('https://maps.googleapis.com/maps/api/distancematrix/json?origins='+origin+'&destinations='+@location.address+'&mode='+@location.default_transport+'&language=en-EN&key='+key) 
    parsed_response = JSON.parse(response.body)
    if parsed_response["rows"][0]["elements"][0]["status"] != "ZERO_RESULTS"
      if @location.save
        redirect_to '/eta'
      else
        flash[:notice] = "Error: Location was not created"
        redirect_to '/eta'
      end
    else 
      flash[:notice] = "Error: Invalid location"
      redirect_to '/eta'
    end
  end

  def update
    # commented out code since the geolocate API finds SERVER location
    @location = Location.find(params[:id])
    # loc_params = location_params.clone
    # loc_params[:longitude] = loc_params[:longitude].to_f
    # loc_params[:latitude] = loc_params[:latitude].to_f
    # neworigin = Location.new(loc_params)
    # stop them from updating to an invalid address!
    key = ENV['MAPS_KEY']
    # origin_query = HTTParty.post('https://www.googleapis.com/geolocation/v1/geolocate?key='+key)
    # parsed_response = JSON.parse(origin_query.body)["location"]
    # origin = parsed_response["lat"].to_s+","+parsed_response["lng"].to_s
    # origin = neworigin.longitude.to_s+","+neworigin.latitude.to_s
    origin = "40.7400337,-73.9895989"
    response = HTTParty.get('https://maps.googleapis.com/maps/api/distancematrix/json?origins='+origin+'&destinations='+@location.address+'&mode='+@location.default_transport+'&language=en-EN&key='+key) 
    parsed_response = JSON.parse(response.body)
    if parsed_response["rows"][0]["elements"][0]["status"] != "ZERO_RESULTS"
      if @location.update_attributes(location_params)
        flash[:notice] = "Your location successfully updated"
        redirect_to '/eta'
      else
        flash[:notice] = "Error: Location not updated"
        redirect_to '/eta'
      end
    else
      flash[:notice] = "Error: Invalid location"
      redirect_to '/eta'
    end
  end

  def sendeta
    msg = "Hey this is "+current_user.name+" I'll be at "+params[:destination]+" in "+params[:time]
    send_to = "+"+params[:send_to]
    send_message(send_to, msg)
    flash[:success] = "ETA sent!"
    redirect_to '/eta'
  end

  def destroy
    @location = Location.find(params[:id])
    if @location.destroy
      flash[:notice] = "Your location successfully deleted"
      redirect_to '/eta'
    end
  end

private

  def set_location
    @location = Location.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def location_params
    params.require(:location).permit(:location_name, :address, :default_transport, :user_id, :longitude, :latitude).merge(user_id: current_user.id)
  end

  def send_message(send_to, msg)
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => send_to,
      :body => msg,
    )
    puts message.body
  end

end

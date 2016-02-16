class LocationsController < ApplicationController

  def index
  end

  def show
    @location = Location.find(params[:id])
  end 

  def new
  end

  def edit
     @location = Location.find(params[:id])
  end

  def delete

  end

  def create
    @location = Location.new(location_params)
    # stop them from entering invalid address!
    key = ENV['MAPS_KEY']
    origin_query = HTTParty.post('https://www.googleapis.com/geolocation/v1/geolocate?key='+key)
    parsed_response = JSON.parse(origin_query.body)["location"]
    origin = parsed_response["lat"].to_s+","+parsed_response["lng"].to_s
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
    location = Location.find(params[:id])
    # stop them from updating to an invalid address!
    key = ENV['MAPS_KEY']
    origin_query = HTTParty.post('https://www.googleapis.com/geolocation/v1/geolocate?key='+key)
    parsed_response = JSON.parse(origin_query.body)["location"]
    origin = parsed_response["lat"].to_s+","+parsed_response["lng"].to_s
    response = HTTParty.get('https://maps.googleapis.com/maps/api/distancematrix/json?origins='+origin+'&destinations='+location.address+'&mode='+location.default_transport+'&language=en-EN&key='+key) 
    parsed_response = JSON.parse(response.body)
    if parsed_response["rows"][0]["elements"][0]["status"] != "ZERO_RESULTS"
      if location.update_attributes(location_params)
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
    params.require(:location).permit(:location_name, :address,  :default_transport, :user_id).merge(user_id: current_user.id)
    end
end

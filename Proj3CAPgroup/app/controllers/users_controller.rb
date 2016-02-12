require 'httparty'

class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
     # string = '/users/' + user.id.to_s +'/show'
     render :show
    else
      redirect_to '/'
    end
  end

  def eta
    # put your google maps key in your own env.
    @key = ENV['MAPS_KEY']
    # set the origin, pull from location?
    # "40.740082199999996,-73.9897896" this format for gps coordinates, no space!
    @origin = "40.740082199999996,-73.9897896"
    #set the destination, pull from database.
    @destination = "1834 2nd Avenue, New York, NY"
    # set the transportation method, pull from db
    @ride = "transit"
    # have to do this httparty hackaround 
    # response = HTTParty.get('https://maps.googleapis.com/maps/api/distancematrix/json?origins='+@origin+'&destinations='+@destination+'&mode='+@ride+'&language=en-EN&key='+@key) <- distance matrix
    response = HTTParty.get('https://maps.googleapis.com/maps/api/directions/json?origin='+@origin+'&destination='+@destination+'&mode='+@ride+'&language=en-EN&key='+@key)
    # turns it useful
    parsed_response = JSON.parse(response.body)  
    # debugger
    # parsed_response["rows"].first["elements"].first["duration"] gets text and value
    # @time=parsed_response["rows"].first["elements"].first["duration"]["text"] <- distance matrix
    # look at the parsed response for directions api!... its enormous!
    @time=parsed_response["routes"].first["legs"].first["duration"]["text"]
# debugger
    render :eta
  end

  def show
    @key = ENV['MAPS_KEY']
    # set the origin, pull from sara's geolocate when its up
    # "40.740082199999996,-73.9897896" this format for gps coordinates, no space!
    @origin = "1834 2nd Avenue, New York, NY"
    @locations = Location.where("user_id = '#{current_user['id']}'")
    render :show
  end
private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def edit
  end

end










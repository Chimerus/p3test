require 'httparty'

class UsersController < ApplicationController
  def index
  end

  def eta
    # put your google maps key in your own env.
    @key = ENV['MAPS_KEY']
    # set the origin, pull from location?
    @origin = 'Chicago'
    #set the destination, pull from database.
    @destination = "San Francisco"
    # set the transportation method, pull from db
    @ride = "bicycling"
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
end

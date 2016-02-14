require 'httparty'
require 'uri'

class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
     # string = '/users/' + user.id.to_s +'/show'
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def show
    @key = ENV['MAPS_KEY']
    # get their current location - google locate
    response = HTTParty.post('https://www.googleapis.com/geolocation/v1/geolocate?key='+@key)
    if response.code != 200 
      flash.now[:error] = "Error: Cannot find location"
    else
      parsed_response = JSON.parse(response.body)["location"]
      @origin = parsed_response["lat"].to_s+","+parsed_response["lng"].to_s
      @locations = Location.where("user_id = '#{current_user['id']}'")
     end 
    render :show
  end
private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def edit
  end

end










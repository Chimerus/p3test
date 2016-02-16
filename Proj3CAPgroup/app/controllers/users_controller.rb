require 'httparty'
require 'uri'

class UsersController < ApplicationController

  def index
    if current_user
      redirect_to '/eta'
    else
      render :index
    end
    
  end
  def new
  end

  def index
    if cookies.permanent[:auth_token]
      redirect_to '/eta'
    else
      render :index
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      cookies.permanent[:auth_token] = user.auth_token
      flash[:notice] = "Thanks for siging up!"
      redirect_to '/eta'
    else
      redirect_to '/'
    end
  end

  def eta
    @key = ENV['MAPS_KEY']
    # get their current location - google geolocate
    response = HTTParty.post('https://www.googleapis.com/geolocation/v1/geolocate?key='+@key)
    if response.code != 200 
      flash.now[:error] = "Error: Cannot find location"
    else
      parsed_response = JSON.parse(response.body)["location"]
      @origin = parsed_response["lat"].to_s+","+parsed_response["lng"].to_s
      @locations = Location.where("user_id = '#{current_user['id']}'")
     end 

    render :eta
  end
private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def edit
  end

end










require 'httparty'
require 'uri'
require 'geocoder'

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

  def edit
     id = params[:id]
    @user = User.find(id)
  end

  def index
    if cookies.permanent[:auth_token]
      redirect_to '/eta'
    else
      render :index
    end
  end

  def update
    id = params[:id]
    @user = User.find(id)
    if @user.update_attributes(user_params)
      flash[:notice] = "Your account was successfully updated "
      redirect_to "/eta"
    else
       flash[:notice] = "Error: Please enter a password"
       redirect_to(:back)
     end
  end

  def create
    user = User.new(user_params)
    if user.save
      cookies.permanent[:auth_token] = user.auth_token
      flash[:notice] = "Welcome to CAP "+user.name+"!"
      redirect_to '/eta'
    else
      email = User.where(email: params['user']['email']).first
      if email 
        flash[:notice] = "The email you entered has already been taken"
         redirect_to '/'
        elsif params['user']['password'].length < 6
          flash[:notice] = "Password is too short"
          redirect_to '/'          
        else
        flash[:notice] = "invalid email"
        redirect_to '/'
      end
    end
  end

  def eta
    if current_user
      # PLANNED: find out way to update the origins in db from current location
      @key = ENV['MAPS_KEY']
      # get their current location - google locate
      # response = HTTParty.post('https://www.googleapis.com/geolocation/v1/geolocate?key='+@key)
      # if response.code != 200 
        # flash.now[:error] = "Error: Cannot find location"
      # else
      # parsed_response = JSON.parse(response.body)["location"]
      # loc_params = location_params.clone
      # loc_params[:longitude] = loc_params[:longitude].to_f
      # loc_params[:latitude] = loc_params[:latitude].to_f
      # neworigin = Location.new(loc_params)
      # @origin = parsed_response["lat"].to_s+","+parsed_response["lng"].to_s
      @locations = Location.where("user_id = '#{current_user['id']}'")
      # if @locations.first
      #   @origin = @locations.first.latitude.to_s+","+@locations.first.longitude.to_s
      # else
      # @origin = "40.7400337,-73.9895989"
      @city = request.location.city
      @country = request.location.country_code
      # end
      render :eta
    else
      redirect_to '/'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  # def location_params
  #   params.require(:location).permit(:location_name, :address, :default_transport, :user_id, :longitude, :latitude).merge(user_id: current_user.id)
  # end

end










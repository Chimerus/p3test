require 'httparty'
require 'uri'

class UsersController < ApplicationController
  def new
  end
  def edit
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
    user = User.find(id)
     binding.pry
    if user.update_attributes(user_params)
      flash[:notic] = "your account was successfully updated "
      redirect_to "/eta"
    else
       flash[:notic] = "Error  your account was not updated"
       redirect_to "/users/#{user.id}/edit"
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
    render :eta
  end
private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  

end










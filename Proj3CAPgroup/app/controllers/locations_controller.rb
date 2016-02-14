class LocationsController < ApplicationController
  # protect_from_forgery with: :null_session
	def index
  end

  # GET /location/1

  def show
<<<<<<< HEAD
    @id = params[:id]
    @location = Location.find(params[:id])
  end
=======
    @location = Location.find(params[:id])
    # binding.pry
  end 
>>>>>>> a1d3ac917665a4f58bfb1d4da2a4b31d4b7a9c12

  # GET /location/new
  def new
  end

  # GET /location/1/edit
  def edit
     @location = Location.find(params[:id])
  end
<<<<<<< HEAD
=======

>>>>>>> a1d3ac917665a4f58bfb1d4da2a4b31d4b7a9c12
  def delete
    @location = Location.find(params[:id])
  end

  # POST /location

  def create
    @location = Location.new(location_params)
     if @location.save
       redirect_to '/eta'
     else
      redirect_to '/edit'
    end
  end

  # PATCH/PUT /location/1
  # PATCH/PUT /location/1.json
  def update
<<<<<<< HEAD

    location = Location.find(params[:id])
    if location.update_attributes(location_params)
      flash[:notice] = "Your location was successfullu updated"
      redirect_to '/eta'
    else
       flash[:notice] = "Sorry The location was not able to be updated, please try again"
     redirect_to '/edit'

    end


    
=======
    location = Location.find(params[:id])
    if location.update_attributes(location_params)
      flash[:notice] = "Your location successfully updated"
      redirect_to '/eta'
    else
     redirect_to '/edit'
    end
>>>>>>> a1d3ac917665a4f58bfb1d4da2a4b31d4b7a9c12
  end

  # DELETE /location/1
  # DELETE /location/1.json
  def destroy
<<<<<<< HEAD
    id = params[:id].to_i
  	@location = Location.find(id)
    @location.destroy
     flash[:notice] = "Your location successfullu deleted"
    redirect_to '/eta'
    
    
=======
  	@location = Location.find(params[:id])
    @Location.destroy

    flash[:notice] = "Your location successfully updated"
      redirect_to '/eta'
    flash[:notice] = "Your location successfully deleted"
      redirect_to '/eta'
>>>>>>> a1d3ac917665a4f58bfb1d4da2a4b31d4b7a9c12
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
    params.require(:location).permit(:location_name, :address,  :default_transport, :user_id).merge(user_id: current_user.id)
    end
end

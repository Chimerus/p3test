class LocationsController < ApplicationController
  # protect_from_forgery with: :null_session
	def index
     
    end

  # GET /location/1

  def show
    @id = params[:id]
    @location = Location.find(params[:id])
  end

  # GET /location/new
  def new
   
  end

  # GET /location/1/edit
  def edit
     @location = Location.find(params[:id])
  end
  def delete
    @location = Location.find(params[:id])
  end

  # POST /location

  def create
  	# binding.pry
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

    location = Location.find(params[:id])
    if location.update_attributes(location_params)
      #flash[:notice] = "Your location successfullu updated"
      redirect_to '/eta'
    else
     redirect_to '/edit'
    end


    
  end

  # DELETE /location/1
  # DELETE /location/1.json
  def destroy
    id = params[:id].to_i
  	@location = Location.find(id)
    binding.pry
    @location.destroy
    redirect_to '/eta'
    
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

  










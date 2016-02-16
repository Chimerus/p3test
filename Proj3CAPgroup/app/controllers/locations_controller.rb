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
     if @location.save
       redirect_to '/eta'
     else
      redirect_to '/edit'
    end
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:notice] = "Your location successfully updated"
      redirect_to '/eta'
    else
     redirect_to '/edit'
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

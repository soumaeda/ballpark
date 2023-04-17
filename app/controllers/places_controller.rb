class PlacesController < ApplicationController
  
  def index
    @places = Place.all
  end
  
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:success] = "球場が登録されました"
      redirect_to places_path
    else
      render new_place_path
    end
  end
  
  def show
    
  end
  
  private
  
  def place_params
    params.require(:place).permit(:place, :place_image)
  end
  
  
end

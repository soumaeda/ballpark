class PlacesController < ApplicationController
  
  def index
    @places = [
      { id: 1, name: "東京ドーム", image: 'parks/tokyo_dome.jpg'},
      { id: 2, name: "エスコンフィールド", image: 'parks/esconfield.jpg'},
      { id: 3, name: "楽天モバイルパーク", image: 'parks/rakuten_mobile_park.jpg'}
    ]
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
    @place = Place.find(params[:id])
    @videos = @place.videos.all
  end
  
  private
  
  def place_params
    params.require(:place).permit(:place, :place_image)
  end
  
  
end

class PlacesController < ApplicationController
  
  def index
    @places = [
      { id: 1, name: "東京ドーム", image: 'parks/tokyo_dome.jpg'},
      { id: 2, name: "エスコンフィールド", image: 'parks/esconfield.jpg'},
      { id: 3, name: "楽天モバイルパーク", image: 'parks/rakuten_mobile_park.jpg'},
      { id: 4, name: "メットライフドーム", image: 'parks/mettolife_dome.jpg'},
      { id: 5, name: "zozoマリンスタジアム", image: 'parks/zozomarine.jpg'},
      { id: 6, name: "明治神宮球場", image: 'parks/jingu.jpg'},
      { id: 7, name: "横浜スタジアム", image: 'parks/yokohama.jpg'},
      { id: 8, name: "バンテリンドーム", image: 'parks/banterin.jpg'},
      { id: 9, name: "京セラドーム", image: 'parks/kyosera.jpg'},
      { id: 10, name: "阪神甲子園球場", image: 'parks/kohshien.jpg'},
      { id: 11, name: "マツダスタジアム", image: 'parks/mazda.jpg'},
      { id: 12, name: "paypayドーム", image: 'parks/paypay_dome.jpg'}
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

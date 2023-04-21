class VideosController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  
  def new
    @video = Video.new
  end

  def show
  end

  def create
    @video = current_user.videos.build(video_params)
    @video.movie.attach(params[:content])
    if @video.save
      flash[:success] = "投稿完了"
      redirect_to root_url, status: :see_other
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @video.destroy
    flash[:success] = "投稿が削除されました"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end
  
  private

    def video_params
      params.require(:video).permit(:content, :movie)
    end
    
    def correct_user
      @video = current_user.videos.find_by(id: params[:id])
      redirect_to(root_url, status: :see_other) if @video.nil?
    end
    
end

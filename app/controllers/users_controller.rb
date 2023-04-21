class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  
  def index
    @users = User.pagenate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @videos = @user.videos.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "新規登録完了"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを変更しました"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_path, status: :see_other
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction)
    end
    
    
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless corrent_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url, status: :see_other) unless current_user.admin?
    end
end

class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update, :show]
  before_action :auth_user!, only:[:edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]= "welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  
  def update
    if @user.update(user_params)
       flash[:success]= "プロフィールを編集しました"
      #保存に成功した場合は、自分のページへ移動する
      redirect_to @user
    else
      render 'edit'
    end
  end
  
    
  private
  def set_user
    @user = User.find(params[:id]) 
  end
  
  def auth_user! 
    if current_user != @user
      flash[:danger]= "不正なアクセスです"
      redirect_to root_url
    end
  end
  
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:location, :profile)
  end
end

class UsersController < ApplicationController
  before_action: only:[:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
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
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update(user_params)
      #保存に成功した場合は、自分のページへ移動する
      redirect_to show ,notice:"プロフィールを編集しました"
    else
      render 'edit'
    end
  end
  
    
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:location, :profile)
  end
end

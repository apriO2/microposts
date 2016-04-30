class MicropostsController < ApplicationController
    before_action :logged_in_user , only:[:create]
      
    def create
      ＠micropost = current＿user.microposts.build(micropost_params)
      if @microposts.save
        flash[:success] = "Microposts created"
        redirect_to root_url
      else
        render 'static_pages/home'
      end
    end
    
    private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end

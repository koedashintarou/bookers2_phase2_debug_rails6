class RelationshipsController < ApplicationController
  before_action :authenticate_user!
   before_action :set_user
   
  def create
    
    current_user.follow(params[:user_id])
		redirect_to request.referer
  end
  
  def destroy
    
    current_user.unfollow(params[:user_id])
		redirect_to request.referer
  end
  
  def followings
   #@user = User.find(params[:user_id])
		@users = @user.followings
		render 'users/index'
  end

  def followers
    #@user = User.find(params[:user_id])
		@users = @user.followers
		render 'users/index'
  end
  
  def set_user
    @user = User.find(params[:user_id])
  end
end


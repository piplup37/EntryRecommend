class FriendController < ApplicationController

  def follow
    @follow_user = User.find(params[:id])
    current_user.friends << @follow_user
    @follow_user.friends << User.find(current_user)
    redirect_to :action => 'users'
  end

  def unfollow
    @unfollow_user = User.find(params[:id])
    current_user.friends.delete(@unfollow_user)
    @unfollow_user.friends.delete(current_user)
    redirect_to :action => 'users'
  end

  def users
    @users = current_user.friends(true)
  end

end

class FriendRequestsController < ApplicationController
  def new
  end

  def confirm
    @friend_request = FriendRequest.new
    @send_user = User.find(params[:to])
  end

  def create
    @friend_request = FriendRequest.new
    @friend_request.message = params[:message]
    @friend_request.to_user_id = params[:to]
    @friend_request.from_user_id = current_user.id
    @friend_request.save
  end

  def send_list
    @friend_requests = FriendRequest.where(:from_user_id => current_user.id)
  end

  def recieve_list
    @recieve_requests = FriendRequest.where(:to_user_id => current_user.id)
  end

  def show
    @friend_request = FriendRequest.find(params[:id])
  end

  def friend_conclude
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.update_attribute(:check,true)
    @friend_request.update_attribute(:approval,true)
    @friend = User.find(@friend_request.from)
    current_user.friends << @friend
    @friend.friends << current_user
    flash[:msg] = 'Friend Conclusion!'
    redirect_to :controller => 'friend',:action => 'users'
  end

end

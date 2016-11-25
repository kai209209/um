class ApplyFriendsController < ApplicationController

  def index
    @apply_friends_receiver = current_user.receiver_apply_friends.apply_status.order(id: :desc)
  end

  def create
    @user = User.find params[:receiver_id]
    @apply = current_user.author_apply_friends.new(receiver: @user, apply_status: 0)
    @apply.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def reapply
    @user = User.find params[:receiver_id]
    @apply = current_user.author_apply_friends.find(receiver_id: params[:receiver_id])
    @apply.apply!
    respond_to do |format|
      format.html
      format.js
    end

  end

  def operate_apply
    @apply_friend = current_user.receiver_apply_friends.find(params[:apply_friend_id])
    if params[:operate] == "pass"
      @apply_friend.pass!
    elsif params[:operate] == "reject"
      @apply_friend.reject!
    end
    
    respond_to do |format|
      format.html
      format.js
    end        

  end


end

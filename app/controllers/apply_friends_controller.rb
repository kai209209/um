class ApplyFriendsController < ApplicationController

  def index
    @apply_friends_receiver = current_user.receiver_apply_friends.apply_status
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
    @apply.update(apply_status: 0)
    respond_to do |format|
      format.html
      format.js
    end

  end


end

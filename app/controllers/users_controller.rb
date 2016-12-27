class UsersController < ApplicationController
  layout 'users'
  def index
    @users = User.search(params, current_user)
  end

  def show
    @user = User.find params[:id]
  end

  def profile
    respond_to do |format|
      format.json
      format.html
    end
  end

  def friends
    @friends = current_user.friends
    respond_to do |format|
      format.json
      format.js
      format.html
    end
  end
end

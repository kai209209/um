class UsersController < ApplicationController
  layout 'users'
  def index
    @users = User.search(params, current_user)
  end

  def show
    @user = User.find params[:id]
  end

  def profile    
  end

  def friends
    @friends = current_user.friends
  end
end

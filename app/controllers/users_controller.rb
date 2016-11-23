class UsersController < ApplicationController
  layout 'users'
  def index
    @users = User.search(params)
  end

  def show
    @user = User.find params[:id]
  end

  def profile    
  end
end

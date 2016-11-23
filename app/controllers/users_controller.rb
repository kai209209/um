class UsersController < ApplicationController
  layout 'users'
  def index
    @users = User.search(params)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @user = User.find params[:id]
  end

  def profile    
  end
end

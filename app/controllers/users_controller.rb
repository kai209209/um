class UsersController < ApplicationController

  def index
    @users = User.search(params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @user = User.find params[:id]
  end

  def profile    
  end
end

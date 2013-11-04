class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to questions_path and return
    else
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end
end
require 'rails_helper'

class UsersController < ApplicationController
  def new
    @user = User.new
    # render :new
  end

  def create
    # save_and_open_page
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :username)
  end
end

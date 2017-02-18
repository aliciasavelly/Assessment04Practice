class SessionsController < ApplicationController
  def index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.where(params[:user][:username], params[:user][:password])

    if @user
      redirect_to links_url
      login(@user)
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:password, :username)
  end
end

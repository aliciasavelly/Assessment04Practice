class SessionsController < ApplicationController
  def index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login(@user)
      redirect_to links_url
    else
      flash.now[:errors] = ["invalid username or pass"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
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

class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login(@user)
      redirect_to links_url
    else
      flash[:errors] = "Invalid username or password"
      render :new
    end
  end

  # def edit
  # end
  #
  # def update
  # end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end

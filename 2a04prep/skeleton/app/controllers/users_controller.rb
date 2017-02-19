class UsersController < ApplicationController
  # before_filter :require_signed_in!

  # def index
  # end
  #
  # def show
  # end

  def new
    @user = User.new
    # render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to links_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end

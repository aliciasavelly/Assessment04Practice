class LinksController < ApplicationController
  before_filter :require_signed_in!

  def new

  end

  def create
    @link = Link.new(link_params)

    if current_user
      render :new
    else
      flash.now[:errors] = @link.errors.full_messages
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index
  end

  private
  def link_params
    params.require(:link).permit(:title, :url, :user_id)
  end
end

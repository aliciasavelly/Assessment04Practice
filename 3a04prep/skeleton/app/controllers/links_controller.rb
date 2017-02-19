class LinksController < ApplicationController
  before_filter :require_logged_in

  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = Link.new
    # render :new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = @current_user.id

    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end

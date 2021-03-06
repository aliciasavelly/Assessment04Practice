class CommentsController < ApplicationController
  before_filter :require_logged_in

  def create
    # @comment = Comment.new(comment_params)
    # @comment.user_id = current_user.id
    #
    # if @comment.save
    #   redirect_to link_url(@comment.link)
    # else
    #   flash[:errors] = @comment.errors.full_messages
    # end
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    flash[:errors] = comment.errors.full_messages
    redirect_to link_url(comment.link)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to link_url(comment.link_id)
  end

  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end
end

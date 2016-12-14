class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.build(comments_params.merge(topic: @topic))
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:content)
  end
end

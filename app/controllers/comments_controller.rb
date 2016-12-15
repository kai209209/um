class CommentsController < ApplicationController
  include ApplicationHelper
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.build(comments_params.merge(topic: @topic))
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
    @comment.update(params)
    redirect_to topic_path(id: params[:topic_id])
  end

  def comment_preview
    content =  Um::Markdown.render(params[:content])
    @content_html = syntax_highlighter(content).html_safe
    respond_to do |format|
      format.js
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:content)
  end
end

class TopicsController < ApplicationController
  include ApplicationHelper

  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      redirect_to topic_path(@topic)
    else
      render 'new'
    end

  end

  def edit    
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_path(@topic)
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  def topic_preview
    content =  Um::Markdown.render(params[:content])
    @content_html = syntax_highlighter(content).html_safe
    respond_to do |format|
      format.js
    end
  end

  private

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :content)
  end
end

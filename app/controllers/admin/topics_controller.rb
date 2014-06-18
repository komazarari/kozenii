class Admin::TopicsController < ApplicationController
  before_action :admin_required
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Successfully created."
    end
    respond_with(@topic, location: admin_topics_url)
  end

  def update
    if @topic.update(topic_params)
      flash[:notice] = "Successfully created."
    end
    respond_with(@topic, location: admin_topics_url)
  end

  def destroy
    @topic.destroy
    flash[:notice] = "Deleted."
    respond_with(@topic, location: admin_topics_url)
  end

  private
  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :body, :enabled)
  end
end

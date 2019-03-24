class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action:logged_in?, only:[:new,:create]

  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
  end

  def new
  if params[:back]
    @feed = Feed.new(feed_params)
  else
    @feed = Feed.new
  end
  end
 
  def create
    @feed = Feed.new(feed_params)
    if @feed.save
    redirect_to user_path(@user.id) 
    else
      render 'new'
    end
  end

 def confirm
   @feed = Feed.new(feed_params)
 end

private

 def set_feed
  @feed = Feed.find(params[:id])
 end

  def feed_params
  params.require(:feed).permit(:image, :image_cache)
  end
end
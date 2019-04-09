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
     @feed = Feed.find_by(id: params[:id])
     @user = User.find_by(id: @feed.user_id)
    
  end  
  

  # GET /feeds/new
   def new
    if params[:back]
      @feed= Feed.new(blog_params)
    else
      @feed = Feed.new
    end
   end
    
    

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    # binding.pry
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    
    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end
  
   def confirm
    @feed= Feed.new(feed_params)
    @feed.user_id = current_user.id #現在ログインしているuserのidを、feedのuser_idカラムに挿入する
    render :new if @feed.invalid?
   end
   
  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
   def update
    respond_to do |format|
      #binding.pry
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
   end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      #binding.pry
      @feed=Feed.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:image, :image_cache, :title, :content, )
    end
end

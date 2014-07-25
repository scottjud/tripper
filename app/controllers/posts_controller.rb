class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @trips = Trip.find(params[:trip_id])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @trips = Trip.find(params[:trip_id])
    @posts = @trips.posts.new
  end

  # GET /posts/1/edit
  def edit
    @trips = Trip.find(params[:trip_id])
    @posts = @trips.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @trips = Trip.find(params[:trip_id])
    @posts = @trips.posts.new(post_params)
   
      if @posts.save
       flash[:success] = "Added new post"
       redirect_to trip_posts_path 
      else
       flash[:error] = "There was a problem"
       render action: :new
      end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @trips = Trip.find(params[:trip_id])
    @posts = @trips.posts.find(params[:id])

    if @posts.update_attributes(post_params)
      flash[:success] = "Updated post"
      redirect_to trip_posts_path
    else
      flash[:error] = "There was a problem with this update"
      render action: :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params[:post].permit(:trip_id, :site, :description)
    end
end

class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    
  end

  # GET /posts/1/edit
  def edit
    authorize_action_for @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    
    redirect_to '/posts'
  
  end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize_action_for @post
    @post.update(post_params)
   
    redirect_to '/posts'
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize_action_for @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
      params.require(:post).permit(:content, :tag_list_fixed)
    end
end

class PostsController < ApplicationController
  
  #FIXME = "foo"
  protect_from_forgery with: :exception
  before_action :authenticate_member!
  
  http_basic_authenticate_with name: "jai", password: "badgire", except: [:index, :show]
  
  def index
  #@posts = Post.all
  @posts = Post.paginate(:page => params[:page])
  end
  
  def new
  @post = Post.new
  end
 
  def create
  #@post = Post.create( post_params )
  @post = Post.new(params[:post].permit(:title, :text, :photo))
 
    if @post.save
     redirect_to @post
    else
     render 'new'
    end
  end
  
  def show
  @post = Post.find(params[:id])
  end
  
  def edit
   @post = Post.find(params[:id])
  end
  
  def update
  @post = Post.find(params[:id])
 
   if @post.update(params[:post].permit(:title, :text))
     redirect_to @post
   else
     render 'edit'
   end
  end
  
  def destroy
   @post = Post.find(params[:id])
   @post.destroy
 
   redirect_to posts_path
  end

private

  def post_params
    params.require(:post).permit(:title, :text, photo)
  end
end

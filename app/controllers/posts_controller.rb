class PostsController < ApplicationController
  http_basic_authenticate_with name: "dnh", password: "secret", except: %i[index show]
  
  def index
    @posts = Post.all
  end

  def show 
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end    
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, status: :see_other
  end 

  private
  
  def post_params
    params.require(:post).permit(:title, :body, :status)
  end
end

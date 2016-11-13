class PostsController < ApplicationController

  http_basic_authenticate_with name: "nilbog", password: "goblin", except: [:index, :show]

  def index
    @posts = Post.all.order(:created_at)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    unless @post
      render_404
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'You have successfully created a new post'
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    flash[:notice] = "You have successfully deleted a post"
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def render_404
    render :file => "/public/404.html",  :status => 404
  end

end
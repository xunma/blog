class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      sql_query = " \
        posts.title @@ :query \
        OR posts.content @@ :query \
        OR users.first_name @@ :query \
        OR users.last_name @@ :query \
      "
      @posts = Post.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @posts = Post.all
    end

  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      #redirect_to feed_path, notice: 'Charity successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
  end

  def my_posts
    @user = User.find(params[:id])
    @my_posts = Post.where(user: @user)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :date, :published, :user_id)
  end
end

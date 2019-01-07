class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :mark, :unmark]

  def index
    if params[:query].present?
      sql_query = " \
        posts.content  @@ :query \
        OR posts.title @@ :query \
        OR users.first_name @@ :query \
        OR users.last_name @@ :query \
      "
      @posts = Post.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @posts = Post.all.order(date: :desc)
    end
  end

  def show
    unless @post.user == current_user
      @post.view += 1
      @post.save!
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: 'Your blog is posted!'
    else
      render :new, notice: 'Sorry, there is an error'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Your blog is updated!'
    else
      render :edit, notice: 'Sorry, there is an error. Try again!'
    end
  end

  def destroy
    if @post.destroy
      redirect_to my_posts_path(current_user)
    end
  end

  def my_posts
    @user = User.find(params[:id])
    @my_posts = Post.where(user: @user)
  end

  def mark
    @mark = Mark.new(user: current_user, post: @post)
    if @mark.save
      respond_to do |format|
        format.js { render 'marks/mark.js.erb' }
      end
    end
  end

  def unmark
    @mark = Mark.where(user: current_user, post: @post).first
    if @mark.destroy
      respond_to do |format|
        format.js { render 'marks/mark.js.erb' }
      end
    end
  end

  def marked_posts
    @marked_posts = Mark.where(user: current_user).map{ |mark| mark.post }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :date, :published, :user_id)
  end
end

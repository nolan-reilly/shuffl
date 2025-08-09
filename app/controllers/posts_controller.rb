class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :authorize_user, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  # Maybe this isn't the right spot because of our routes???

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
     redirect_to @post, notice: "Post Successfully Created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def authorize_user
    @user = User.find(params[:user_id])
    redirect_to root_path, alert: "Not authorized" unless @user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

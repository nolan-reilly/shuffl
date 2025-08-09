class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [ :edit, :update ]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User Successfully Updated"
    else
      flash.now[:alert] = "Couldn't Update User"
      render :edit
    end
  end

  def destroy
  end

  def follow
    @user_to_follow = User.find(params[:id])

    current_user.followings << @user_to_follow
    redirect_to user_path(@user_to_follow), notice: "#{@user_to_follow.username} successfully followed"
  end

  def unfollow
    @user_to_unfollow = User.find(params[:id])

    current_user.followings.delete(@user_to_unfollow)
    redirect_to user_path(@user_to_unfollow), notice: "#{@user_to_unfollow.username} successfully unfollowed"
  end

  private

  def authorize_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: "Not authorized" unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :password)
  end
end

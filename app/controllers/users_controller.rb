class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [ :edit ]

  def index
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: "Not authorized" unless @user == current_user
  end
end

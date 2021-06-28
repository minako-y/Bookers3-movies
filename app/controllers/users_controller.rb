class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @new_movie = Movie.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @new_movie = Movie.new
    @movies = @user.movies
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

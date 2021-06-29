class MoviesController < ApplicationController

  def index
    @new_movie = Movie.new
    @movies = Movie.all
    @user = User.find(current_user.id)
  end

  def show
    @new_movie = Movie.new
    @movie = Movie.find(params[:id])
    @user = User.find(current_user.id)
    @post_comment = PostComment.new
  end

  def create
    @new_movie = Movie.new(movie_params)
    @new_movie.user_id = current_user.id
    @new_movie.save
    redirect_to movies_path
  end

  def edit
    @new_movie = Movie.new
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end


  private
  def movie_params
    params.require(:movie).permit(:title, :impressions, :image)
  end

end

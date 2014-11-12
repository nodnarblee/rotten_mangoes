class MoviesController < ApplicationController

  before_action :load_movie, only: [:update, :destroy, :edit, :show]

  def index
    @movies = Movie.all
    # @movies = Movie.search(params[:title])
  end

  def search
    @movies = Movie.search(params[:search])
    render :index
  end

  def show
  end

  def new
    @movies = Movie.all
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully"
    else
      render :new
    end
  end

  def update
    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def load_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :image
    )
  end
end

class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result(distinct: true).includes(:casts, :crews, :reviews,
                                                 :bookmarks, :directors, :actors).page(params[:page]).per(10)
  end

  def show
    @bookmark = Bookmark.new
    @review = Review.new
    @crew = Crew.new
    @cast = Cast.new
  end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie, notice: "Movie was successfully created."
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: "Movie was successfully destroyed."
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :image, :bio, :year, :duration)
  end
end

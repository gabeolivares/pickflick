class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def search
    @movie_search = Movie.search(params[:search], params[:search_param])
    render json: @movie_search
  end

  def search_imdb
    Tmdb::Api.key("de2613d4749d2db22c32998b38ba4efc")
    @movie_api_search = Tmdb::Search.new
    @movie_api_search.resource("movie")
    @movie_api_search.query(params[:search])
    render json:  @movie_api_search.fetch
  end

  def create
     @movie_create = Movie.create!(genre: params[:genre], actors: params[:actors], title: params[:title], year: params[:year], rating: params[:rating])
     @movie_create.save
     render json: @movie_create
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie_destroy = Movie.find(params[:id]).destroy
    render json: @movie_destroy
  end

  def update
    @movie_update = Movie.find(params[:id])
    @movie_update.update_attributes(genre: params[:genre], actors: params[:actors], title: params[:title], year: params[:year], rating: params[:rating])
    render json: @movie_update
  end

end

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    # default: render 'new' template
  end

  def show
    id = params[:id]
    begin
      @movie = Movie.find(id)
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "No se encontró ninguna película con ese ID."
      redirect_to movies_path
    end
  end
end

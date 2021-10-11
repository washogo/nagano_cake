class Admin::GenresController < ApplicationController
  @genre=Genre.new
  
  def index
    @genres=Genre.all
  end
  
  def create
    @genre= Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end
  
  def edit
    
  end
  
  def update
  end
  
  private

  def genre_params
    params.permit(:name)
  end
end

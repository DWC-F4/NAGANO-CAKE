class Admins::GenresController < ApplicationController

	def index
	  @genre = Genre.new
	  @genre = Genre.all
	end

	def edit
	  @genre = Genre.find(params[:id])
	end

	def create
	  @genre = Genre.new(genre_params)
	  if @genre.save
	  	redirect_to admins_genres
	  else
	  	 @genre = Genre.all
	  	 render :index
	end

	def update
	  @genre = Genre.find(params[:id])
	  if @genre.update(genre_params)
	  	redirect_to admins_genres
	  else 
	  	render "edit"
	end

  private
	def genre_params
	  params.require(:genre).permit(:name ,:genre_status)
	end

end

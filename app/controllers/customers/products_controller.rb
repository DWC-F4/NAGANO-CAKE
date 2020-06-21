class Customers::ProductsController < ApplicationController

	def index
		if params[:genre_id]
			@genre = Genre.find(params[:genre_id])
			@products = @genre.products.all
		else
			@products = Product.all
		end
	end

	def show
		@product = Product.find(params[:id])
		@products = Product.all
		@genres = Genre.all
	end
end

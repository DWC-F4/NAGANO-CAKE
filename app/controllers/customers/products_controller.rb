class Customers::ProductsController < ApplicationController

	def index
		if params[:genre_id]
			genre = Genre.find(params[:genre_id])
			@products = genre.products
			@title = genre.name
		else
			@products = Product.all
			@title = "商品"
		end
		@genres = Genre.all
	end

	def show
		@product = Product.find(params[:id])
		@genres = Genre.all
		@cart_item = CartItem.new
	end
end

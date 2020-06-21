class Customers::ProductsController < ApplicationController

	def index
		@product = Product.find
		@products = Product.all
		@genres = Genre.all
	end

	def show
		@product = Product.find(params[:id])
		@products = Product.all
		@genres = Genre.all
	end
end

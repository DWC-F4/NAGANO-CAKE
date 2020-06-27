class Customers::ProductsController < ApplicationController

	def index
		if params[:genre_id]
			genre = Genre.find(params[:genre_id])
			@products = Kaminari.paginate_array(genre.products)
			@products = @products.page(params[:page]).per(8)

			@title = genre.name
		else
			@products = Product.active
			@products = @products.select {|active| active.genre.genre_status == false}
			@products = Kaminari.paginate_array(@products).page(params[:page]).per(8)

			@title = "商品"
		end
		@genres = Genre.active
	end

	def show
		@product = Product.find(params[:id])
		@genres = Genre.all
		@cart_item = CartItem.new
	end
end

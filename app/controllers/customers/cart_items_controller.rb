class Customers::CartItemsController < ApplicationController
	def index
		@products = Product.all
		# @cart_items = @products.cart_items.id

	end

	def create
	end

	def destroy
	end

	def destroy_all
	end

	def update
	end

end

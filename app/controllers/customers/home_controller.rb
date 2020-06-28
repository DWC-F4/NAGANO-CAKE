class Customers::HomeController < ApplicationController

	def top
		@products = Product.all
		@reccomends = @products.sample(3)
		@genres = Genre.active
	end

end

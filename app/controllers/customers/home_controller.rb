class Customers::HomeController < ApplicationController

	def top
		@products = Product.all
		@reccomend = @products.sample
		@genres = Genre.active
	end

end

class Customers::HomeController < ApplicationController

	def top
		@products = Product.all
		@reccomend = @products.sample
		@genres = Genre.all
	end

end

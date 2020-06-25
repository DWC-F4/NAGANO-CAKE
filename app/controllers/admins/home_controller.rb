class Admins::HomeController < ApplicationController
	before_action :authenticate_admin!

	layout "admin"

	def top
		range = Date.today.beginning_of_day..Date.today.end_of_day
		@orders =  Order.where(created_at: range)
	end

	def search
		@range = params[:range]
		search = params[:search]
		@word = params[:word]

		case @range
			when "1"
				@user = User.search(search,@word)
			when "2"
				@product = Product.search(search,@word)
			when ""
				redirect_back(fallback_location: root_path)
		end
	end
end

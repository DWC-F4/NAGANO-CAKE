class Admins::HomeController < ApplicationController
	before_action :authenticate_admin!

	layout "admin"

	def top
		today = Date.today
		@orders = Order.where(created_at: today)
	end
end

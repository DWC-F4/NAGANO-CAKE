class Customers::OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def show
		@orders = Order.all
	end

	def new
	end

	def confirm
	end

	def thanks
	end

	def create
	end

end

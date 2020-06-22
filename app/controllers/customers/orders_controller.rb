class Customers::OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def show
	    @order = Order.find(params[:id])
	    @sum = 0
			@sum += @order.price + @order.postage
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

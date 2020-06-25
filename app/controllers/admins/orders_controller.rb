class Admins::OrdersController < ApplicationController
	layout "admin"

	def index
	  @users = User.all
	  @orders = Order.page(params[:page])
	end

	def show
	  @order = Order.find(params[:id])
	end

	def update
	  @order = Order.find(params[:id])
	  if @order.update(order_params)
	  	if @order.order_status == "入金確認"
	  		@order.order_details.each do |order_detail|
	  			order_detail.product_status = "製作待ち"
	  			order_detail.save
	  		end
	  	end
	  	flash[:notice] = "注文履歴詳細が変更されました。"
	  	redirect_to admins_order_path(@order)
	  else
	  	render "show"
	  	flash[:alert] = "変更内容を確認してください。"
	  end
	end

private
  def order_params
  	params.require(:order).permit(:order_status)
  end
end

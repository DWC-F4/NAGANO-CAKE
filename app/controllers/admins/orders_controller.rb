class Admins::OrdersController < ApplicationController
	layout "admin"

	def index
	  @users = User.all
	  @orders = Order.all
	end

	def show
	  @user = User.find(params[:id])
	  @order = Order.find(params[:id])
	end

	def update
	  @order = Order.find(params[:id])
	  if @order.update(order_params)
	  	flash[:notice] = "注文履歴詳細が変更されました。"
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

class Customers::OrderDetailsController < ApplicationController

	def update
	  @order_detail = OrderDetail.find(params[:id])
	  if @order_detail.update(order_detail_params)
	  	flash[:notice] = "注文履歴詳細が変更されました。"
	  	redirect_to admins_orders_path
	  else 
	  	render "order/show"
	  	flash[:alert] = "変更内容を確認してください。"
	  end
	end

  private
  def order_detail_params
  	params.require(:order_detail).permit(:product_status)
  end

end
class Admins::OrderDetailsController < ApplicationController

	layout "admin"
	def  update
		@order_detail = OrderDetail.find(params[:id])
		@order_detail.order.order_status
		if @order_detail.update(order_details_params)
			if @order_detail.product_status == "製作中"
				@order_detail.order.order_status = "製作中"
				@order_detail.order.save
			else order = @order_detail.order.order_details
				if
					order.each do |d|
						 d.product_status == "製作完了"
					end
					@order_detail.order.order_status = "発送準備中"
					@order_detail.order.save
				end
			end
			flash[:notice] = "製作ステータスを変更しました。"
			redirect_to admins_order_path(@order_detail.order.id)
		else
			render "show"
		end

	end

	private
		def order_details_params
			params.require(:order_detail).permit(:product_status)
		end
end

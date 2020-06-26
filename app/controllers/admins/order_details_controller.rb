class Admins::OrderDetailsController < ApplicationController

	layout "admin"
	def  update
		@order_detail = OrderDetail.find(params[:id])
		if @order_detail.update(order_details_params)
			if @order_detail.product_status == "製作中"
				@order_detail.order.order_status = "製作中"
				@order_detail.order.save
			elsif @order_detail.product_status == "製作完了"
				if @order_detail.order.order_details.where(product_status: "製作完了").count == @order_detail.order.order_details.count
			# 	count = 0
			# @order_detail.order.order_details.each do |o|
			# 	 if o.product_status == "製作完了"
			# 	 	count += 1
			# 	 end
			# 	 if count == o.order.order_details.count
			# 	 @order_detail.order.update(order_status: "発送準備中")
			# 	end
			# end
				@order_detail.order.update(order_status: "発送準備中")
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

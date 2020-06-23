class Customers::CartItemsController < ApplicationController
	def index
		@cart_items = current_user.cart_items
		@sum = 0
		@cart_items.each do |cart|
			@sum += ((cart.product.price*1.10) * cart.quantity).round
		end
		@sum = @sum.to_s(:delimited)
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.user_id = current_user.id

		@suffered = CartItem.find_by(product_id: @cart_item.product_id, user_id: current_user.id)
		if @suffered.nil?
			if @cart_item.save
				flash[:notice] = "カートに追加しました"
				redirect_to customers_cart_items_path
			else
				redirect_back(fallback_location: root_path)
			end
		else
			@suffered.update(cart_item_params)
			#@suffered.update(quantity: @suffered.quantity+1)
			# 下記を1行にまとめた記述
			# @suffered.quantity += 1
			# @suffered.save
			redirect_to customers_cart_items_path
		end
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		flash[:notice] = "カートから削除しました"
		redirect_to customers_cart_items_path
	end

	def destroy_all
		cart_items = current_user.cart_items
		cart_items.destroy_all
		flash[:notice] = "カートを空にしました"
		redirect_to customers_cart_items_path
	end

	def update
		cart_item = CartItem.find(params[:id])
		cart_item.update(cart_item_params)
		flash[:notice] = "数量を変更しました"
		redirect_to customers_cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:user_id, :product_id, :quantity)
	end

end

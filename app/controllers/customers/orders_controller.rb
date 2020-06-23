class Customers::OrdersController < ApplicationController
	before_action :authenticate_user!
	def index
	end

	def show
	end

	def new
		@order = Order.new
        @addresses = current_user.delivery_infos
	end

	def confirm
		@order = Order.new(order_params)
        @cart_items = current_user.cart_items
        @addresses = current_user.delivery_infos
        if params[:address] == "my_address"
            @order.postal_code = current_user.postal_code
            @order.address = current_user.address
            @order.address_name = current_user.first_name + current_user.last_name
            flash[:alert] = "入力内容を確認してください"
        elsif params[:address] == "delivery_address"
            @delivery_info = DeliveryInfo.find(params[:delivery_info][:id])
            @order.postal_code = @delivery_info.postal_code
            @order.address = @delivery_info.address
            @order.address_name = @delivery_info.address_name
            flash[:alert] = "入力内容を確認してください"
        elsif params[:address] == "new_address"
            @delivery_info = DeliveryInfo.new(user_id: current_user.id)
            @delivery_info.postal_code = @order.postal_code
            @delivery_info.address = @order.address
            @delivery_info.address_name = @order.address_name
            if @delivery_info.save
                render :confirm
            else
                flash[:alert] = "入力内容を確認してください"
                render :new
            end
        end
	end

	def thanks
        flash[:notice] = "購入しました。"
	end

	def create
		@order = Order.new(order_params)
        @order.user_id = current_user.id
        @order.save
        @cart_items = current_user.cart_items
        @cart_items.each do |cart_item|
            @order_detail = OrderDetail.new
            @order_detail.quantity = cart_item.quantity
            @order_detail.price = cart_item.product.price
            @order_detail.order_id = @order.id
            @order_detail.product_id = cart_item.product_id
            @order_detail.save
        end
        current_user.cart_items.destroy_all
        redirect_to thanks_customers_orders_path
	end

	private

	def order_params
        params.require(:order).permit(:payment, :postal_code, :address, :address_name, :user_id, :postage, :price, :order_status)
    end
end

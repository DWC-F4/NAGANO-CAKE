class Admins::ProductsController < ApplicationController

	before_action :set_product, only: %i[show edit update]
	before_action :authenticate_admin!

	layout "admin"

	def index
		@products = Product.page(params[:page])
	end

	def show
	end

	def new
		@product = Product.new
		@genres = Genre.all
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "商品情報を登録しました。"
			redirect_to admins_products_path
		else
			render "new"
		end
	end

	def edit
		@genres = Genre.all
	end

	def update
		if @product.update(product_params)
			flash[:notice] = "商品情報を更新しました。"
			redirect_to admins_product_path(@product.id)
		else
			render "edit"
		end
	end

	# def destroy
	# end

	private

	def product_params
		params.require(:product).permit(:name, :price, :image, :introduction, :sales_status, :genre_id)
	end

	def set_product
		@product = Product.find(params[:id])
	end


end

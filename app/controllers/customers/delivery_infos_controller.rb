class Customers::DeliveryInfosController < ApplicationController

	before_action :authenticate_user!

	#配送先一覧
    def index
        @user = current_user
        @delivery_infos = @user.delivery_infos
        @delivery_info = DeliveryInfo.new
    end

    #配送先新規保存
    def create
        @delivery_info = DeliveryInfo.new(delivery_info_params)
        @delivery_info.user_id = current_user.id
       if @delivery_info.save
           flash[:notice] = "登録に成功しました"
           redirect_to customers_delivery_infos_path
        else
            @user = current_user
            @delivery_infos = @user.delivery_infos
            flash[:alert] = "入力内容を確認してください"
            render :index
        end
    end

    #配送先削除
    def destroy
        @delivery_info = DeliveryInfo.find(params[:id])
        @delivery_info.destroy
        flash[:notice] = "削除に成功しました"
        redirect_to customers_delivery_infos_path
    end

    #配送先編集
    def edit
        @delivery_info = DeliveryInfo.find(params[:id])
        if  current_user.id != @delivery_info.user_id
            flash[:alert] = "アクセス権がありません"
            redirect_to customers_delivery_infos_path
        end
    end

    #編集内容保存
    def update
        @delivery_info = DeliveryInfo.find(params[:id])
		if @delivery_info.update(delivery_info_params)
            redirect_to customers_delivery_infos_path
            flash[:notice] =  "更新に成功しました"
        else
            flash[:alert] = "入力内容を確認してください"
            render :edit
        end
    end

private
    def delivery_info_params
        params.require(:delivery_info).permit(:postal_code, :address, :address_name, :user_id)
    end
end

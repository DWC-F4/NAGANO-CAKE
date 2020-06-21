class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
	layout "admin"
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	    if @user.update(user_params)
	       flash[:notice] = "会員情報を更新しました。"
	       redirect_to admins_user_path(@user.id)
	    else
               flash[:alert] = "入力内容を確認して下さい。"    
	       render "edit"
	    end
	end

	private
	  def user_params
	  	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email, :user_status)
	  end

end

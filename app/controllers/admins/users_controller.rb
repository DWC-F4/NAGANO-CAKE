class Admins::UsersController < ApplicationController
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
	    if @user.update(user_params)
	       redirecet_to admins_user_path
	    else
	       render "edit"
	    end
	end

	private
	  def user_params
	  	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email, :user_status)
	  end
end

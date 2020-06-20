class Customers::UsersController < ApplicationController

	def show
	  @user = current_user
	end

	def edit
	  @user = User.find(params[:id])
	end

	def unsubscribe
	end

	def update
	  @user = User.find(params[:id])
	  if @user.update(user_params)
	  	redirect_to customers_user_path(current_user), notice: "登録情報を変更しました。"
	  else 
	  	render "edit"
	  end
	end

	def leave
	end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :phone_number)
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :delivery_infos
  has_many :orders
  has_many :cart_items

  def active_for_authentication?
    super && (self.user_status == false)
  end

  class << self

    def search(search,word)
      if search == "forward_match"
        @user = User.where("first_name LIKE? OR last_name LIKE?" , "#{word}%","#{word}%")
      elsif search == "backward_match"
        @user = User.where("first_name LIKE? OR last_name LIKE?", "%#{word}","%#{word}")
      elsif search == "perfect_match"
        @user = User.where("first_name LIKE? OR last_name LIKE?", "#{word}", "#{word}")
      elsif search == "partial_match"
        @user = User.where("first_name LIKE? OR last_name LIKE?" , "%#{word}%","%#{word}%")
      else
        @user = User.all
      end
    end

  end

end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :delivery_infos
  has_many :orders
  has_many :cart_items

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :postal_code, format: { with: /\A\d{7}\z/, message: "はハイフン無しで入力してください。"}
  validates :address, presence: true
  validates :phone_number, format: { with: /\A\d{11}\z/, message:"はハイフン無しで入力してください。"}
  validates :email, format: { with:  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }


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

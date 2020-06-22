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

end
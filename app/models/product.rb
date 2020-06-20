class Product < ApplicationRecord
	belongs_to :ganre
	has_many :cart_items
	has_many :order_details
	attachment :profile_image
end

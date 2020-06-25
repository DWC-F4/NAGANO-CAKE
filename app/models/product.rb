class Product < ApplicationRecord

	attachment :image
	has_many :cart_items
	has_many :order_details
	belongs_to :genre

	scope :active, -> {where(sales_status: false)}

end

class OrderDetail < ApplicationRecord
	belongs_to :products, optional: true
	belongs_to :orders, optional: true
end

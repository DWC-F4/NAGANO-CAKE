class Order < ApplicationRecord
	belongs_to :user
	has_many :order_detail
	accepts_nested_attributes_for :order_detail
	enum payment: {クレジットカード: 1, 銀行振込: 2}
end

class Order < ApplicationRecord
	belongs_to :user
	has_many :order_details
	accepts_nested_attributes_for :order_details
	enum payment: {クレジットカード: 1, 銀行振込: 2}
	enum order_status: {入金待ち: 1, 入金確認: 2, 製作中: 3, 発送準備中: 4, 発送済み: 5}
	validates :postal_code, presence: true
	validates :address, presence: true
	validates :address_name, presence: true
end

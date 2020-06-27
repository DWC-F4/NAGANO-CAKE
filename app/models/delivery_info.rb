class DeliveryInfo < ApplicationRecord

	belongs_to :user

	validates :postal_code, format: { with: /\A\d{7}\z/, message: "ハイフン無しで入力してください。"}
	validates :address, presence: true
	validates :address_name, presence: true

	def to_address_name
		postal_code + " " + address + " " + address_name
	end

end

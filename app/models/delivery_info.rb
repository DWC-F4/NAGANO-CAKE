class DeliveryInfo < ApplicationRecord

	belongs_to :user

	validates :postal_code, presence: true
	validates :address, presence: true
	validates :address_name, presence: true

	def to_address_name
		postal_code + " " + address + " " + address_name
	end

end

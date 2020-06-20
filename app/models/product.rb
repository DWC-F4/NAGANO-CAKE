class Product < ApplicationRecord
<<<<<<< HEAD
	attachment :image
	has_many :cart_items
	has_many :order_details
	belongs_to :genre
=======
	belongs_to :ganre
	has_many :cart_items
	has_many :order_details
	attachment :profile_image
>>>>>>> d654fb4052325d9961ad014e7c270881ce3f78dc
end

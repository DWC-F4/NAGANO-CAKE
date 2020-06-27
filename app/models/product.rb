class Product < ApplicationRecord

	attachment :image
	has_many :cart_items
	has_many :order_details
	belongs_to :genre

	validates :name, presence: true, length: { maximum: 30 }
	validates :introduction, presence: true, length: {maximum: 200}
	validates :price, presence: true
	validates :sales_status, inclusion: { in: [true, false] }

	scope :active, -> {where(sales_status: false)}

	class << self

	    def search(search,word)
	      if search == "forward_match"
	        @product = Product.where("name LIKE?", "#{word}%")
	      elsif search == "backward_match"
	        @product = Product.where("name LIKE?", "%#{word}")
	      elsif search == "perfect_match"
	        @product = Product.where(name: word)
	      elsif search == "partial_match"
	        @product = Product.where("name LIKE?", "%#{word}%")
	      else
	        @product = Product.all
	      end
	    end

	 end

	validates :name, presence: true
	validates :price, presence: true
	validates :introduction, presence: true, length: {maximum: 20}
	validates :sales_status, inclusion: { in: [true, false] }
end

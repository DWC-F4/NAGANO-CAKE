class Genre < ApplicationRecord
	has_many :products

	scope :active, -> {where(genre_status: false)}
	validates :name, presence: true
end

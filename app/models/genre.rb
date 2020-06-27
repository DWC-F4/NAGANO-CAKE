class Genre < ApplicationRecord
	has_many :products

	validates :name, presence: true

	scope :active, -> {where(genre_status: false)}
	validates :name, presence: true
end

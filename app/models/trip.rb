class Trip < ApplicationRecord 
	validates :price, :date, :distance, presence: true
	validates :price, :distance, numericality: true
end

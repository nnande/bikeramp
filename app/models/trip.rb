class Trip < ApplicationRecord
	belongs_to :start_address, class_name: Address, foreign_key: :start_address_id
	belongs_to :destination_address, class_name: Address, foreign_key: :destination_address_id

	validates :price, :date, :distance, :start_address, :destination_address, presence: true
	validates :price, :distance, numericality: true
end

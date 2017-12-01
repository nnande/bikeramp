class Trip < ApplicationRecord
	belongs_to :start_address, class_name: Address, foreign_key: :start_address_id
	belongs_to :destination_address, class_name: Address, foreign_key: :destination_address_id

	validates :price, :date, :distance, :start_address, :destination_address, presence: true
	validates :price, :distance, numericality: true
	validates_associated :start_address, :destination_address
	
	before_save :provide_distance

	private

	def provide_distance
		svc = DistanceProvider.new(self); svc.call
		self.distance = svc.distance_in_kilometers
	end
end

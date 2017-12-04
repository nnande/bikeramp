class Trip < ApplicationRecord
  belongs_to :start_address, class_name: Address, foreign_key: :start_address_id
  belongs_to :destination_address, class_name: Address, foreign_key: :destination_address_id

  validates :price, :date, :distance, :start_address, :destination_address, presence: true
  validates :price, :distance, numericality: true
  validates_associated :start_address, :destination_address
	
  before_validation :provide_distance
		
  accepts_nested_attributes_for :start_address
  accepts_nested_attributes_for :destination_address

  scope :from_current_week, lambda { 
                                     where('date >= ?', Time.current.beginning_of_week)
                                    .where('date <= ?', Time.current)
				   }

  scope :from_current_month, lambda {
				      where('date >= ?', Time.current.beginning_of_month)
				     .where('date <= ?', Time.current)
			            }
  private

  def provide_distance
    svc = DistanceProvider.new(self); svc.call
    self.distance = svc.distance_in_kilometers
  end
end

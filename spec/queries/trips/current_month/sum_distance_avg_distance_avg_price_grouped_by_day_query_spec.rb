require 'rails_helper'

RSpec.describe Trips::CurrentMonth::SumDistanceAvgDistanceAvgPriceGroupedByDayQuery, type: :query do
	subject { described_class.new }
	
	describe '#all', :vcr do
		let!(:current_month_trip1) { create(:trip, price: 50) }
		let!(:current_month_trip2) { create(:trip, price: 10) }
                let!(:last_month_trip) { create(:trip, date: Time.current - 1.month) }

                it 'returns price sum, avg distance and avg price from current month grouped by day' do
                        result = subject.all[0]
			
			expect(result.day).to eq(current_month_trip1.date.to_date)
			expect(result.total_distance).to eq(current_month_trip1.distance + current_month_trip2.distance)
                        expect(result.avg_ride).to eq((current_month_trip1.distance + current_month_trip2.distance) / 2)
                        expect(result.avg_price).to eq((current_month_trip1.price + current_month_trip2.price) / 2 )
                end
	end
end

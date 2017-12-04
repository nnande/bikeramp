require 'rails_helper'

RSpec.describe Trips::CurrentWeek::SumPriceAndDistanceQuery, type: :query do
  subject { described_class.new }

    describe '#all', :vcr do
      let!(:current_week_trip) { create(:trip) }
      let!(:last_week_trip) { create(:trip, date: Time.current - 1.week) }
		
      it 'returns price and distance sum from current week' do
        result = subject.all[0]

	expect(result.total_price).to eq(current_week_trip.price)
	expect(result.total_distance).to eq(current_week_trip.distance)
      end
    end
end

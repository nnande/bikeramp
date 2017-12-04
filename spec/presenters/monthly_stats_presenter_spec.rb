require 'rails_helper'

RSpec.describe MonthlyStatsPresenter,:vcr, type: :presenter do
  subject { described_class.new(collection) }
  let!(:collection) { Trips::CurrentMonth::SumDistanceAvgDistanceAvgPriceGroupedByDayQuery.new.all }

  %i[trip1 trip2 trip3 trip4].each do |trip|
    let!(trip) { create(:trip, date: Time.current.beginning_of_month) }
  end
  let!(:trip4) { create(:trip, date: Time.current - 1.month) } 
  let(:result) do
    [
      {
        day: 'December, 1st',
 	total_distance: '0km',
	avg_ride: '0km',
	avg_price: '100.0PLN'
      }
    ]
  end

  describe '#as_json' do
    it 'returns json formatted weekly stats' do
      expect(subject.as_json).to eq(result)
    end
  end
end

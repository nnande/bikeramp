require 'rails_helper'

RSpec.describe WeeklyStatsPresenter,:vcr, type: :presenter do
  subject { described_class.new(object) }

  let!(:trip) { create(:trip) }
  let(:object) { res = Trips::CurrentWeek::SumPriceAndDistanceQuery.new.all; res[0] }
  let(:result) { { total_distance: '0km', total_price: '100.0PLN' } }

  describe '#as_json' do
    it 'returns json formatted weekly stats' do
      expect(subject.as_json).to eq(result)
    end
  end
end

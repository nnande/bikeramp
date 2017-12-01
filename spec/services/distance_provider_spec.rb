require 'rails_helper'

RSpec.describe DistanceProvider, vcr: true, type: :service do
	subject { described_class.new(trip) }

	describe '#call' do
		context 'with valid trip (existing addresses)' do
			let(:trip) { build(:trip) }

			it 'sets distance_in_kilometers attribute' do
				subject.call
				expect(subject.distance_in_kilometers).to eq(0.0)		
			end
		end

		context 'with invalid trip (non-existing addresses' do
			let(:trip) { build(:trip).tap { |t| t.start_address.city = 'Sin City' } }

			it 'raises error' do
				expect { subject.call }.to raise_error
			end 
		end
	end
end

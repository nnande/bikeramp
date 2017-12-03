require 'rails_helper'

RSpec.describe TripPresenter, type: :presenter do
	subject { described_class.new(object) }

	describe '#as_json' do
		context 'when initialized with non-Trip object' do
			let(:object) { build(:address) }

			it 'raises error' do
				expect { subject.as_json }.to raise_error
							  .with_message(I18n.t(:invalid_object_type, scope: [:errors, :presenters]))
			end
		end

		context 'when initialized with Trip object', :vcr do
			let(:object) { create(:trip) }
			let(:response) do
				{
					id: object.id,
					price: object.price,
					date: object.date,
					distance: object.distance,
					start_address: object.start_address.full,
					destination_address: object.destination_address.full
				}
			end

			it 'responds with json formatted Trip object' do
				expect(subject.as_json).to eq(response)
			end
		end
	end
end

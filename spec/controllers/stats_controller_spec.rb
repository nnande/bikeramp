require 'rails_helper'

RSpec.describe StatsController, type: :controller do
	describe '#weekly' do
		let(:action) { get :weekly }

		it 'responds with 200 status code' do
			action
			expect(response.status).to eq(200)
		end

		context 'when there are no trips' do
			let(:res) { { 'total_distance' => '0km', 'total_price' => '0PLN' } }
 
			it 'responds with 0-initialized hash' do
				action
				expect(json).to eq(res)
			end
		end

		context 'when there are some trips', :vcr do
			let(:res) { { 'total_distance' => '0km', 'total_price' => '300.0PLN' } }

			before { create_list(:trip, 3) }

			it 'responsds with json formatted stats' do
				action
				expect(json).to eq(res)
			end
		end
	end

	describe '#monthly' do
		let(:action) { get :monthly }
	
		it 'responds with 200 status code' do
			action
			expect(response.status).to eq(200)
		end

		context 'when there are no trips' do
			it 'responds with an empty array' do
				action
				expect(json).to be_empty
			end
		end

		context 'when there are some trips', :vcr do
			let(:res) do
				[
					{
					  'day' => 'December, 1st',
					  'total_distance' => '0km',
					  'avg_ride' => '0km',
					  'avg_price' => '100.0PLN' 
					},
					{ 
					  'day' => 'December, 2nd',
					  'total_distance' => '0km',
				 	  'avg_ride' => '0km',
					  'avg_price' => '100.0PLN'
					}
				]

			end

			before do
				create(:trip, date: Time.current.beginning_of_month)
				create(:trip, date: Time.current.beginning_of_month + 1.day)
				create(:trip, date: Time.current.beginning_of_month + 1.month)
			end

			it 'responds with json formatted stats' do
				action
				expect(json).to eq(res)
			end
		end
	end
end

require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  describe '#create' do
    let(:action) { post :create, params: params }
	
      context 'when params are invalid' do
        let(:params) { { price: '100.123', date: 'yesterday', start_address: 'My home' } }
	let(:res) do
	  {
	    'errors' => {
	      'price' => ['is in invalid format'],
  	      'date' => ['is in invalid format'],
   	      'start_address' => ['start_address is not valid'],
   	      'destination_address' => ['destination_address is not valid']
	    }
	  }
	end			

	it 'responds with 406 status code and error messages' do
	  action
	  expect(response.status).to eq(406)
	  expect(json).to eq(res)
	end
      end
	
      context 'when params are valid', :vcr do
        let(:params) do
	  {
	     price: '100.20',
	     date: '02-12-2017',
	     start_address: 'Polna 15, Toruń, Polska',
	     destination_address: 'Kujawska 1, Toruń, Polska'
	  }
        end

	it 'responds with 200 status code' do
	  action
	  expect(response.status).to eq 200
	end

	it 'creates new trip' do
	  expect { action }.to change(Trip, :count).by(1)
	end
     end
  end
end

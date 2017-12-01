require 'rails_helper'

RSpec.describe Trip, type: :model do
	context 'validations', :vcr do
		subject { create(:trip, distance: 100) }
		
		before { allow_any_instance_of(described_class).to receive(:provide_distance) } 	
	
		context 'presence' do

			%i[price date distance start_address destination_address].each do |attribute|
				it { is_expected.to validate_presence_of(attribute) }
			end
		end

		context 'numericality' do
			%i[price distance].each do |attribute|
				it { is_expected.to validate_numericality_of(attribute) }
			end
		end
	end
	
	context 'associations' do
		%i[start_address destination_address].each do |assoc|
			it { is_expected.to belong_to(assoc).with_foreign_key("#{assoc}_id")}
		end
	end
end

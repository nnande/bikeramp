require 'rails_helper'

RSpec.describe Trip, type: :model do
	context 'validations' do
		context 'presence' do
			%i[price date distance].each do |attribute|
				it { is_expected.to validate_presence_of(attribute) }
			end
		end

		context 'numericality' do
			%i[price distance].each do |attribute|
				it { is_expected.to validate_numericality_of(attribute) }
			end
		end
	end
end

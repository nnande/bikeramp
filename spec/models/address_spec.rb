require 'rails_helper'

RSpec.describe Address, type: :model do
	context 'validations' do
		context 'presence' do
			%i[line city country].each do |attribute|
				it { is_expected.to validate_presence_of(attribute) }
			end
		end
	end

	describe '#full' do
		subject { build(:address) }

		it 'retrns line, city and country joined with comma' do
			expect(subject.full).to eq('Plac Europejski 2, Warszawa, Polska')
		end
	end
end

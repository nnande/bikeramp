require 'rails_helper'

RSpec.describe Address, type: :model do
	context 'validations' do
		context 'presence' do
			%i[line city country].each do |attribute|
				it { is_expected.to validate_presence_of(attribute) }
			end
		end
	end
end

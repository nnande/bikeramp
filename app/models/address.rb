class Address < ApplicationRecord
	validates :line, :city, :country, presence: true
end

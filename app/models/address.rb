class Address < ApplicationRecord
  validates :line, :city, :country, presence: true

  def full
    "#{line}, #{city}, #{country}"
  end
end

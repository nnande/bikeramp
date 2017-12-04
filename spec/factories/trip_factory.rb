FactoryBot.define do
  factory :trip do
    price 100
    date { Time.current }
    distance 15
    start_address { build(:address) }
    destination_address { build(:address) }
  end
end


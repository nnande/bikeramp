class MonthlyStatsPresenter < BasePresenter
	ATTRIBUTES = %i[day total_distance avg_ride avg_price]

	def initialize(collection)
		@collection = collection
	end
	
	def as_json
		@collection.map do |object|
			ATTRIBUTES.each_with_object({}) do |attribute, hash|
                        	hash[attribute] = map_data(object)[attribute]
			end
                end
	end

	private

	def type
		Trip
	end

	def map_data(object)
		{
			day: format_day(object),
			total_distance: "#{object.total_distance&.round || 0}km",
			avg_ride: "#{object.avg_ride&.round || 0}km",
			avg_price: "#{object.avg_price|| 0}PLN",
		}
	end

	def format_day(object)
		day = object.day
		day.strftime("%B, #{day.day.ordinalize}")
	end
end

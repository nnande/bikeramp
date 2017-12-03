class WeeklyStatsPresenter < BasePresenter
	ATTRIBUTES = %i[total_distance total_price]

	def as_json
		ATTRIBUTES.each_with_object({}) do |attribute, hash|
			hash[attribute] = map_data[attribute]
		end
	end

	private

	def type
		Trip
	end

	def map_data
		{
			total_distance: "#{@object.total_distance&.round || 0}km",
			total_price: "#{@object.total_price || 0}PLN"
		}
	end
end

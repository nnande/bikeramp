class DistanceProvider
	class Gistance::NoResultDataError < StandardError; end

	attr_reader :distance_in_kilometers
	
	def initialize(trip)
		@trip = trip
		@client = Gistance
	end

	def call
		@distance_in_kilometers = distance
	end

	private
	
	def distance
		response = @client.distance_matrix(options)[:rows][0][:elements][0]
		
		if response.empty?
			raise Gistance::NoResultDataError I18n.t(:no_result_data, scope: [:errors, :gistance])
		end

		response[:distance][:value].to_d / 1000
	end

	def options
		{
			origins: [trip_address(:start)],
			destinations: [trip_address(:destination)]
		}
	end

	def trip_address(kind)
		@trip.public_send("#{kind}_address").full
	end
end

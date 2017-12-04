class TripsController < ApplicationController
  before_action :validate_input, only: :create
  before_action :prepare_input, only: :create

  def create		
    trip = Trip.new(trip_params)
    if trip.save
      render json: TripPresenter.new(trip).as_json
    else
      render json: { errors: trip.errors }, status: :unprocessable_entity
    end
  end

  private

  def validate_input
    schema = TripSchema
    return if (result = schema.call(trip_params)).success?

    render json: { errors: result.errors }, status: :not_acceptable and return
  end
	
  def prepare_input
    %i[start_address destination_address].each do |address|
      @trip_params["#{address}_attributes".to_sym] = prepare_addresses_params(address)
        @trip_params.delete(address)
      end
    end

    def prepare_addresses_params(kind)
      line, city, country = @trip_params[kind].split(',')

      { 
        line: line,
	city: city,
	country: country,			
      }
    end

    def trip_params
      @trip_params ||= params.permit(:price, :date, :start_address, :destination_address)
    end
end

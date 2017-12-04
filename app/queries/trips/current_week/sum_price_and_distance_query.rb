module Trips
  module CurrentWeek
    class SumPriceAndDistanceQuery < ::Trips::BaseQuery
      SCOPE = :from_current_week
			
      def params
        'SUM (price) AS total_price, SUM(distance) AS total_distance'
      end
    end
  end
end

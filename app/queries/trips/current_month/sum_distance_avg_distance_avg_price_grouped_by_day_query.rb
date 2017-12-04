module Trips
  module CurrentMonth
    class SumDistanceAvgDistanceAvgPriceGroupedByDayQuery < ::Trips::BaseQuery
      SCOPE = :from_current_month

      def all
        super.group('date(date)').order('date(date)')
      end
		
      def params
        'date(date) AS day, SUM(distance) AS total_distance, AVG(price) AS avg_price, AVG(distance) AS avg_ride'
      end
    end
  end
end

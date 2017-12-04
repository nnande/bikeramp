class StatsController < ApplicationController
	def monthly
		data = Trips::CurrentMonth::SumDistanceAvgDistanceAvgPriceGroupedByDayQuery.new.all
		parsed_data = MonthlyStatsPresenter.new(data).as_json

		render json: parsed_data
	end

	def weekly
		data = Trips::CurrentWeek::SumPriceAndDistanceQuery.new.all
		parsed_data = WeeklyStatsPresenter.new(data[0]).as_json

		render json: parsed_data
	end
end

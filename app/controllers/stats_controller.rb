class StatsController < ApplicationController
	def weekly
		data = Trips::CurrentWeek::SumPriceAndDistanceQuery.new.all
		parsed_data = WeeklyStatsPresenter.new(data[0]).as_json

		render json: parsed_data
	end
end

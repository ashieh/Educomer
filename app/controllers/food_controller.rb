class FoodController < ApplicationController
	def index
		@query_results = Food.search(params[:query])
	end
end

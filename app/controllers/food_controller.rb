class FoodController < ApplicationController
	#show is 1
	#index is all of it
	def index
		@foods = Food.search(params[:query])
	end

	def show
		@food = Food.find(params[:id])
	end
end

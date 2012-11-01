class FoodController < ApplicationController
	#show is 1
	#index is all of it
	def index
		@foods = Food.search(params[:query])
	end

	def show
		@food = Food.find(params[:id])
	end

	def edit
		@food = Food.find(params[:id])
	end

	def update
		@food = Food.find(params[:id])
		@food.update_attributes!(params[:food])
		flash[:notice] = "#{@food.name} was successfully updated."
		redirect_to food_path(@food)
	end
end

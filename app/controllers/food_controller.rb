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
		if user_signed_in?
			if current_user.has_role? :registered or current_user.has_role? :banned
				redirect_to food_path(Food.find(params[:id]))
			else
				@food = Food.find(params[:id])
			end
		else
			redirect_to food_path(Food.find(params[:id]))
		end
	end

	def update
		@food = Food.find(params[:id])
		@food.update_attributes!(params[:food])
		flash[:notice] = "#{@food.name} was successfully updated."
		redirect_to food_path(@food)
	end
end

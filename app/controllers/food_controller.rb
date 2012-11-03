class FoodController < ApplicationController
	#show is 1
	#index is all of it
	def index
		@foods = Food.search(params[:query])
		if @foods.empty?
			flash[:notice] = "No results found"
			redirect_to root_path
		elsif @foods.length == 1
			#if only one result, go straight to page
			redirect_to food_path(@foods[0])
		end
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

class FoodController < ApplicationController
	#show is 1
	#index is all of it
	def index
		@foods = Food.search(params[:query])
		if @foods.empty?
			flash[:notice] = "No results found"
			redirect_to :back
		elsif @foods.length == 1
			#if only one result, go straight to page
			redirect_to food_path(@foods[0])
		end
	end

	def show
		@food = Food.find(params[:id])
		@ingredients = []
		@food.ingredients.split(',').each do |name|
			ingredient = Ingredient.find_by_name(name)
			if ingredient
				@ingredients.push(ingredient)
			end
		end
		#@decode = ZXing.decode "#{Rails.root}/app/assets/images/#{@food.UPC}~2.JPG"
	end

	def pending
		@foods = Food.find_all_by_pending(true)
		if @foods.empty?
			flash[:notice] = "No results found"
			redirect_to :back
		elsif @foods.length == 1
			#if only one result, go straight to page
			redirect_to food_path(@foods[0])
		end
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

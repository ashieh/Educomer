class Food < ActiveRecord::Base
	attr_accessible :UPC, :econ_advice, :econ_score, :gastro_advice, :gastro_score, :ingredients, :name, :nutr_advice, :nutr_score

	def self.search(query)
		if query
			if Rails.env == "production"
				find(:all, :conditions => ['name ILIKE ?', "%#{query}%"])
			else
				find(:all, :conditions => ['name LIKE ?', "%#{query}%"])
			end
		else
			find(:all)
		end
	end
end

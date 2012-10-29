class Food < ActiveRecord::Base
	attr_accessible :UPC, :econ_advice, :econ_score, :gastro_advice, :gastro_score, :ingredients, :name, :nutr_advice, :nutr_score

	def self.search(query)
		if query
			find(:all, :conditions => ['name ILIKE ?', "%#{query}%"])
		else
			find(:all)
		end
	end
end

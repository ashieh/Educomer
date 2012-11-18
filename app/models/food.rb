class Food < ActiveRecord::Base
	attr_accessible :UPC, :econ_advice, :econ_score, :gastro_advice, :gastro_score, :ingredients, :name, :nutr_advice, :nutr_score, :pending

	def self.search(query)
		if query
			if query =~ /^[0-9]+$/
				#return list of length 1 if searching by upc
				[find_by_UPC(query)]
			else
				if Rails.env == "production"
					find(:all, :conditions => ['name ILIKE ?', "%#{query}%"])
				else
					find(:all, :conditions => ['name LIKE ?', "%#{query}%"])
				end
			end
		else
			find(:all)
		end
	end
end

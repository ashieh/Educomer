#!/usr/bin/env ruby

require 'csv'
require 'iconv'

#call by typing "ruby preprocess.rb input.csv" in command line
if ARGV.length > 0
	inputCSV = ARGV[0]
else
	raise "Error; no input csv file entered"
end

file = File.open("../db/seeds.rb", "wb")
file.write("#encoding: UTF-8\n")
#ignores non-ascii characters


file.write "foods = ["
CSV.open("FoodData.csv", "rb").each do |row|
	Imagen_1,Imagen_2,Imagen_3,Imagen_4,UPC,Product_food,Presentation_ml,Price,Porcion_ml,KCAL,Hidratos_de_carbono,PROTEINA,GRASA,FIBRA,Ingredients,Nut_category,Super_category,Suggested_category,Nutrit_score,Econom_score,Gastro_score,Nutrit_Advice,Econom_advice,Gastro_advice,Sodium,cafein = row
	if UPC.to_i.to_s == UPC
		file.write "{"
		
		#ignores non-ascii characters
		file.write ":name => '#{Product_food}',"
		file.write ":UPC => '#{UPC}',"
		file.write ":ingredients => '#{Ingredients}',"
		file.write ":nutr_score => '#{Nutrit_score}',"
		file.write ":econ_score => '#{Econom_score}',"
		file.write ":gastro_score => '#{Gastro_score}',"
		file.write ":nutr_advice => '#{Nutrit_Advice}',"
		file.write ":econ_advice => '#{Econom_advice}',"
		file.write ":gastro_advice => '#{Gastro_advice}'"
		file.write "}"
		file.write ",\n"
	end
end
file.write "]"

file.write "\n"
file.write "foods.each do |food|\n"
file.write "\tFood.create!(food)\n"
file.write "end"
file.close

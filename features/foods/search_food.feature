Feature: search for food
 
  As a user
  So that I can find information about a food product
  I want to search for food
  
Background: foods have been added to database 

  Given the following foods exist:
  | name                   | UPC | ingredients 					|nutr_score|econ_score|gastro_score|nutr_advice |econ_advice|gastro_advice|
  | Acorn                  | 1   | Nuts  						|1		   |1		  |1		   |no nutrition|expensive  |funny shape  |
  | Cookie				   | 2   | Milk, Eggs 					|3		   |4		  |8		   |no nutrition|expensive  |funny shape  |
  | Chocorate Acorn		   | 3   | Chocolate, Nuts 				|4		   |4		  |4		   |no nutrition|expensive  |funny shape  |
  | Chocorate Ice Cream    | 4   | Milk, Chocolate, Ice, Cream  |10		   |10		  |10		   |super good  |cheap      |delicious    |
  | Chocorate              | 5   | Chocolate, Deliciousness     |1		   |1		  |1		   |no nutrition|expensive  |funny shape  |
  | Peanut Butter          | 6   | Peanuts, Butter  			|1		   |1		  |1		   |no nutrition|expensive  |funny shape  |
  | Egg					   | 7   | Baby Chicken  				|1		   |1		  |1		   |no nutrition|expensive  |funny shape  |
  | Milk        		   | 8   | Cow Hormones   				|1		   |1		  |1		   |no nutrition|expensive  |funny shape  |
  | Milky Way 			   | 9   | Chocolate, Tylenol  			|1		   |1		  |1		   |no nutrition|expensive  |funny shape  |
  | Poca Pola              | 10  | Pepsi  						|1		   |1		  |1		   |no nutrition|expensive  |funny shape  |


Scenario: Search for an exact match
	When I am on the home page
	And I fill in "query" with "Egg"
	And I press "submit_query"
	Then I should see "Egg"
	
Scenario: Search for a substring
	When I am on the home page
	And I fill in "query" with "Coca"
	And I press "submit_query"
	Then I should see "Coca Cola"
	
Scenario: Search for multiple results
	When I am on the home page
	And I fill in "query" with "Chocorate"
	And I press "submit_query"
	Then I should see "Chocorate"
	Then I should see "Chocorate Acorn"
	Then I should see "Chocorate Ice Cream"
	
Scenario: Search for substring
	When I am on the home page
	And I fill in "query" with "Milk"
	And I press "submit_query"
	Then I should see "Milk"
	Then I should see "Milky Way"
	
Scenario: Search for ingredients
	When I am on the home page
	And I fill in "query" with "Poca Pola"
	And I press "submit_query"
	Then I should see "Poca Pola"
	And I should see "Pepsi"
	
Scenario: Search for ingredients in multiple results
	When I am on the home page
	And I fill in "query" with "Chocorate"
	And I press "submit_query"
	Then I should see "Chocorate"
	Then I should see "Chocorate Acorn"
	When I follow "More about Chocorate"
	Then I should see "Deliciousness"
	
Scenario: Search by UPC
	When I am on the home page
	And I fill in "query" with "1"
	And I press "submit_query"
	Then I should see "Acorn"

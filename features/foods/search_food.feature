Feature: search for food
 
  As a user
  So that I can find information about a food product
  I want to search for food
  
Background: foods have been added to database 

  Given the following foods exist:
  | name                   | UPC | ingredients 					|
  | Acorn                  | 1   | Nuts  						|
  | Cookie				   | 2   | Milk, Eggs 					|
  | Chocolate Acorn		   | 3   | Chocolate, Nuts 				|
  | Chocolate Ice Cream    | 4   | Milk, Chocolate, Ice, Cream  |
  | Chocolate              | 5   | Chocolate, Deliciousness     |
  | Peanut Butter          | 6   | Peanuts, Butter  			|
  | Egg					   | 7   | Baby Chicken  				|
  | Milk        		   | 8   | Cow Hormones   				|
  | Milky Way 			   | 9   | Chocolate, Tylenol  			|
  | Coca Cola              | 10  | Pepsi  						|


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
	And I fill in "query" with "Chocolate"
	And I press "submit_query"
	Then I should see "Chocolate"
	Then I should see "Chocolate Acorn"
	Then I should see "Chocolate Ice Cream"
	
Scenario: Search for substring
	When I am on the home page
	And I fill in "query" with "Milk"
	And I press "submit_query"
	Then I should see "Milk"
	Then I should see "Milky Way"
	
Scenario: Search for ingredients
	When I am on the home page
	And I fill in "query" with "Milk"
	And I press "submit_query"
	Then I should see "Milk"
	When I follow "More about the food"
	And I should see "Cow"
	
Scenario: Search for UPC
	When I am on the home page
	And I fill in "query" with "Acorn"
	And I press "submit_query"
	Then I should see "1"

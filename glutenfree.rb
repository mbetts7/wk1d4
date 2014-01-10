#Title: Gluten Free
 
#Prerequisites:
#- Ruby
#    - Exceptions
#    - Hashes & Arrays
#    - Objects & Classes
 
#Objectives:
#- Work with exceptions, classes, class variables, conditions
 
"======================================================================"
 
# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.

class AllergyError < ArgumentError
end
 
class Person
	
	attr_accessor :stomach, :allergies

	def initialize(allergies)
		@stomach = []
		@allergies = allergies
	end

	def eat(food)
		@stomach += food
		for item in @stomach                 # could do .each do item
			if item == @allergies
				@stomach = []
				# puts "You shouldn't eat #{item}. You spit them out"  ---- don't need this because rescue error takes care of it
				raise AllergyError.new("You are allergic to that")
			end
        end
	end

end

# these foods have these ingredients
pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

Chris = Person.new("gluten")
puts Chris

Beth = Person.new("scallops")
puts Chris
Beth

begin
	Chris.eat(pizza)
rescue AllergyError 
	puts "Chris could not eat gluten.  Stomach has been emptied."
end

begin
Beth.eat(pan_seared_scallops)
rescue AllergyError 
	puts "Beth could not eat gluten.  Stomach has been emptied."
end


# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods
# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError
# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception
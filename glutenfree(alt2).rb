# Program that rejects illegal elements from arrays passed to instance variables of custom class objects.
# require 'pry' => uncomment for debugging console

class AllergyError < RuntimeError		#inheritance
end 

class Person
	
	attr_accessor :name, :stomach, :allergies
	
	def initialize(name, stomach, allergies)
		@name = name
		@stomach = stomach
		@allergies = allergies
	end

	def eat(food)
		begin 	# begin error control trapping
			food.each do |food_item|
				if @allergies.include?(food_item)
					raise AllergyError.new
				else
					@stomach.push(food) # alternatively @stomach << food
				end
			end
			# for each component of food, if the instance variable allergies also contains that food
			# then that person is allergic, causing an AllergyError
			# otherwise the person eats the food
		rescue AllergyError => my_error
			@stomach.pop  
			# if the person has begun to eat food to which they are allergic... it comes back up.
			puts "#{@name}: 'That is not going to work for me.'"
			# binding.pry # => would uncomment for actual debugging of a runtime error
		end 		# end error control trapping
	end
end

pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

per1 = Person.new("Chris", [], ["gluten"]) 	# reminder = instance variables represent initial stomach contents and allergies
per2 = Person.new("Beth", [], ["scallops"])

# declare allergies
puts "#{per1.name} has an allergy to #{per1.allergies.join}."	
puts "#{per2.name} has an allergy to #{per2.allergies.join}."

# eat food
puts "#{per1.name} is thirsty and drinks some water."
per1.eat(water)

puts "#{per1.name} is so hungry he tries to eat pizza..."
per1.eat(pizza) 	 									

puts "#{per2.name} is so hungry she tries to eat seared scallops..."
per2.eat(pan_seared_scallops)				

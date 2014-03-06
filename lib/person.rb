 class Person

 	def initialize
		@bike ||= []
	end

	def has_bike?
		bike.empty? == false
	end

	def bike
		@bike 
	end

	def rent_from(station)
		raise "You can only use one bike at a time, you greedy bastard!" if @bike.length == 1
		bike << station.pop
	end

	def fall_down
		bike[0].break
	end

	def bike_broken?
		bike[0].broken?
	end

	def steal_bike_from(person)
		print "#{self} Just stole a bike from #{person}"
		bike << person.bike.pop
	end

end
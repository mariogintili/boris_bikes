 class Person

 	attr_reader :name

 	def initialize(name)
 		@name = name
 	end

	def has_bike?
		!bike.nil?
	end

	def bike
		@bike 
	end

	def bike=(bike)
		@bike = bike
	end

	def rent_from(station)
		raise "You can only use one bike at a time, you greedy bastard!" if bike
		self.bike=(station.pop)
	end

	def fall_down
		bike.break
	end

	def bike_broken?
		bike.broken?
	end

	def steal_bike_from(person)
		"#{self} Just stole a bike from #{person}"
		self.bike = person.bike
		person.drop_bike		
	end

	def drop_bike
		self.bike = nil
	end

end
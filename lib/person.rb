 class Person

 	def initialize
		@bike ||= []
	end

	def has_bike?
		@bike.empty? == false
	end

	def bike
		@bike 
	end

	def rent_from(station)
		@bike << station.pop
	end

	def fall_down
		@bike[0].break
	end

	def bike_broken?
		@bike[0].broken?
	end

end
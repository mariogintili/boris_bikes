require_relative "./bike_container"

class Van
	include BikeContainer

	def take_broken_bikes_to(garage)
		broken_bikes.each {|broken_bike| garage.bikes << broken_bike  } 
	end

	def take_available_bikes_to(docking_station)
		available_bikes.each {|available_bike| docking_station.bikes << available_bike }
	end
end

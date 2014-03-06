require 'person'
require  'bike'
require 'docking_station'

	describe Person do

		let (:bike) {Bike.new}
		let (:station) {DockingStation.new}
		let (:mario) {Person.new}

		it "should take a bike from docking station" do
			station.dock(bike)
			mario.rent_from(station.available_bikes)
			expect(mario.has_bike?).to eq(true) 
		end

		it "should be able to fall off and break the bike" do
			station.dock(bike)
			mario.rent_from(station.available_bikes)
			mario.fall_down
			expect(mario.bike_broken?).to eq(true) 
		end
	end
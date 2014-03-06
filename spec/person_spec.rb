require 'person'
require  'bike'
require 'docking_station'

	describe Person do

		let (:bike) {Bike.new}
		let (:station) {DockingStation.new}
		let (:mario) {Person.new}

		before do
			station.dock(bike)
			mario.rent_from(station.available_bikes)
		end

		it "should take a bike from docking station" do
			expect(mario.has_bike?).to eq(true) 
		end

		it "should be able to fall off and break the bike" do
			mario.fall_down
			expect(mario.bike_broken?).to eq(true) 
		end

		it "raises an error if person tries to rent +1 bike" do
			station.dock(bike)
			expect { mario.rent_from(station.available_bikes) }.to raise_error(RuntimeError)
		end

		it "steals a bike from another person" do
			jordan = Person.new
			jordan.steal_bike_from(mario)
			expect(jordan.has_bike?).to eq(true)
		end
	end
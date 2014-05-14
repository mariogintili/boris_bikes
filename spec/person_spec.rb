require 'person'
require  'bike'
require 'docking_station'

	describe Person do

		let (:bike) {Bike.new}
		let (:station) {DockingStation.new}
		let (:person) {Person.new 'Mario'}
		let (:jordan) {Person.new 'Jordan'}
		let (:evgeny) {Person.new 'Evgeny'}

		before do
			station.dock(bike)
			person.rent_from(station.available_bikes)
		end

		it '#name' do
			expect(person.name).to eq('Mario')
		end

		it "should take a bike from docking station" do
			expect(person.has_bike?).to eq(true) 
		end

		it "should be able to fall off and break the bike" do
			person.fall_down
			expect(person.bike_broken?).to eq(true) 
		end

		it "raises an error if person tries to rent +1 bike" do
			station.dock(bike)
			expect { person.rent_from(station.available_bikes) }.to raise_error(RuntimeError)
		end

		it "steals a bike from another person" do
			jordan.steal_bike_from(person)
			expect(jordan).to have_bike
		end

		it 'shows a message when a bike is stolen' do
			expect(jordan.steal_bike_from(person)).to eq 'Jordan stole a bike from Mario!'
		end

		it "checks that the bike was stolen" do
			evgeny.steal_bike_from(person)
			expect(person.bike). to eq(nil)
		end
	end
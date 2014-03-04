require_relative "../lib/van"
require 'bike'
require 'docking_station'
	class FakeGarage; include BikeContainer end

	describe Van do

		let(:van) {Van.new}
		let(:fake_garage) {FakeGarage.new}
		let(:docking_station) {DockingStation.new}
		let(:garage) {FakeGarage.new}

		context "should" do

			before do

				@working_bike, @broken_bike = Bike.new, Bike.new
				@broken_bike.break
				van.dock(@working_bike)
				van.dock(@broken_bike)
				van.dock(@broken_bike)
			end

			it "load broken bikes to the van" do
				van.dock(@broken_bike)
				expect(van.broken_bikes.count).to eq(3)
			end

			it "takes only broken bikes to the garage" do
				 van.dock(@working_bike)
				 van.dock(@working_bike)
				 van.dock(@broken_bike)
				 van.broken_bikes.each { |bike| fake_garage.bikes << bike  }
				 expect(fake_garage.broken_bikes.count).to eq(3)
			end

			it "takes only fixed bikes to the docking station" do
				van.available_bikes.each {|bike| docking_station.bikes << bike }
				expect(docking_station.available_bikes.count).to eq(1)
			end

			it "moves broken bikes to the garage" do
				van.take_broken_bikes_to(garage)
				expect(garage.broken_bikes.count).to eq(2)
			end

			it "moves available bikes to docking station" do
				van.take_available_bikes_to(docking_station)
				expect(docking_station.available_bikes.count).to eq(1)
			end

			it "moves bikes to destination" do
				van.take_available_bikes_to(docking_station)
				expect(docking_station.available_bikes.count).to eq(1)
			end
		end
	end
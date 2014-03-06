require 'garage'
require 'van'

describe Garage do

	let(:van) {Van.new}
	let(:garage) {Garage.new}

	before do

		@working_bike, @broken_bike = Bike.new, Bike.new
		@broken_bike.break
		garage.dock(@working_bike)
		garage.dock(@broken_bike)
		garage.dock(@broken_bike)
	end

	it "takes in bikes that are broken" do
		expect(garage.broken_bikes.count).to eq(2)
	end

	it "fixes bikes" do
		garage.repair(@broken_bike)
		expect(garage.broken_bikes.count).to eq(0)
	end
end
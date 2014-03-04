require_relative "../lib/van"
require 'bike'
	class FakeGarage; include BikeContainer end

	describe Van do

		let(:van) {Van.new}
		let(:fake_garage) {FakeGarage.new}

		context "should" do

			before do

				@working_bike, @broken_bike = Bike.new, Bike.new
				@broken_bike.break
			end

			it "load broken bikes to the van" do
				van.dock(@broken_bike)
				expect(van.broken_bikes.count).to eq(1)
			end

			it "takes only broken bikes to the garage" do
				 van.dock(@working_bike)
				 van.dock(@working_bike)
				 van.dock(@broken_bike)
				 van.broken_bikes.each { |bike| fake_garage.bikes << bike  }
				 expect(fake_garage.broken_bikes.count).to eq(1)
			end
		end
	end

	# Take in the array not turn it in to an array 
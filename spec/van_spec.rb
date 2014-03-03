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

				it "take a broken bike to the garage" do
					 van.dock(@broken_bike)
					 expect(fake_garage.broken_bikes.count).to eq(1)
				end
		end
	end
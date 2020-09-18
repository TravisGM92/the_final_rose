require 'rails_helper'

RSpec.describe "Outing show page" do
  describe "As a visitory When I visit an outings show pages," do
    describe "I see that outings name, location, and date" do
      it "And I see a total count of contestants that were on this outing and a list of all names of the contestants that went on this outing" do

        bachelorette_1 = Bachelorette.create!(name: "The Spicy Spring", season_number: 3, description: "The most spicy season ever!")

        contestant_1 = bachelorette_1.contestants.create!(name: "George Henry", age: 32, hometown: "Denver")
        contestant_2 = bachelorette_1.contestants.create!(name: "Travis Nopers", age: 29, hometown: "Denver")

        outing_1 = contestant_1.outings.create!(name: "Kickball", location: "Utah", date: "2-14-20")
        outing_2 = contestant_1.outings.create!(name: "Hot Springs", location: "New York", date: "3-5-20")
        outing_3 = contestant_1.outings.create!(name: "Helicopter Ride", location: "New York", date: "3-10-20")

        visit "/outing/#{outing_1.id}"

        expect(page).to have_content(outing_1.name)
        expect(page).to have_content(outing_1.location)
        expect(page).to have_content(outing_1.date)
        end
      end
    end
  end

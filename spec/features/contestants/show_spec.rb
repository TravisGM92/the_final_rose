require 'rails_helper'

RSpec.describe "Contestant show page" do
  describe "As a visitory when I visit a contestants show page," do
    describe "I see that contestants' name as well as the season number and season description that this contestant was on" do
      it "I also see a list of names of the outings that this contestant has been on while on the show." do

        bachelorette_1 = Bachelorette.create!(name: "The Spicy Spring", season_number: 3, description: "The most spicy season ever!")

        contestant_1 = bachelorette_1.contestants.create!(name: "George Henry", age: 32, hometown: "Denver")
        contestant_2 = bachelorette_1.contestants.create!(name: "Travis Nopers", age: 29, hometown: "Denver")

        outing_1 = contestant_1.outings.create!(name: "Kickball")
        outing_2 = contestant_1.outings.create!(name: "Hot Springs")
        outing_3 = contestant_1.outings.create!(name: "Helicopter Ride")

        visit "/contestant/#{contestant_1.id}"

        expect(page).to have_content(contestant_1.name)
        expect(page).to have_content(bachelorette_1.season_number)
        expect(page).to have_content(bachelorette_1.description)

        expect(page).to have_content(outing_1.name)
        expect(page).to have_content(outing_2.name)
        expect(page).to have_content(outing_3.name)
        end
      end
    end
  end

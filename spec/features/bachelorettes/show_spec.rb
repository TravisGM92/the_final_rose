require 'rails_helper'

RSpec.describe "Bachelorette show page" do
  describe "As a visitory when I visit '/bachelorettes/:id'," do
    describe "I see that bachelorettes name, season number, description of season they were on" do
      it "I also see a link to that bachelorettes contestants" do

        bachelorette_1 = Bachelorette.create!(name: "The Spicy Spring", season_number: 3, description: "The most spicy season ever!")

        contestant_1 = bachelorette_1.contestants.create!(name: "George Henry", age: 32, hometown: "Denver")
        contestant_2 = bachelorette_1.contestants.create!(name: "Travis Nopers", age: 29, hometown: "Denver")

          visit "/bachelorettes/#{bachelorette_1.id}"

          expect(page).to have_content(bachelorette_1.name)
          expect(page).to have_content(bachelorette_1.season_number)
          expect(page).to have_content(bachelorette_1.description)


          expect(page).to have_link("View contestants")
          click_link("View contestants")
          expect(current_path).to eq("/bachelorette/#{bachelorette_1.id}/contestants")
        end
      end
    end
    describe "When I click that link I'm taken to '/bachelorettes/:bachelorette_id/contestants'" do
      it "and I can see only that bachelorettes' contestants" do

        bachelorette_1 = Bachelorette.create!(name: "The Spicy Spring", season_number: 3, description: "The most spicy season ever!")
        bachelorette_2 = Bachelorette.create!(name: "The Cold Winter", season_number: 2, description: "A cold dagger")


        contestant_1 = bachelorette_1.contestants.create!(name: "George Henry", age: 32, hometown: "Denver")
        contestant_2 = bachelorette_1.contestants.create!(name: "Travis Nopers", age: 29, hometown: "Denver")
        contestant_3 = bachelorette_2.contestants.create!(name: "Humphry Dude", age: 29, hometown: "Denver")


          visit "/bachelorettes/#{bachelorette_1.id}"

          expect(page).to have_content(bachelorette_1.name)
          expect(page).to have_content(bachelorette_1.season_number)
          expect(page).to have_content(bachelorette_1.description)


          expect(page).to have_link("View contestants")
          click_link("View contestants")
          expect(page).to have_content(contestant_1.name)
          expect(page).to have_content(contestant_2.name)
          expect(page).to_not have_content(contestant_3.name)
      end
    end
  end

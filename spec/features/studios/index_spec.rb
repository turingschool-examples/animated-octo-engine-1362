require "rails_helper"

RSpec.describe "Studio Index Page", type: :feature do
  before :each do
    @hollywood = Studio.create!(name: "Hollywood", location: "LA")
    @paramount = Studio.create!(name: "Paramount Studios", location: "Culver City")

    @TS = @hollywood.movies.create!(title: "Toy Story", creation_year: "2008", genre: "Fictional")
    @Hulk = @hollywood.movies.create!(title: "Hulk", creation_year: "2010", genre: "Action")

    @Dune = @paramount.movies.create!(title: "Dune", creation_year: "2021", genre: "Action")
    @HungerGames = @paramount.movies.create!(title: "Hunger Games", creation_year: "2012", genre: "Action")
  end

  it "displays the studios name, location, and movies and corresponding attributes" do
    visit "/studios"

    within("#studio-#{@hollywood.id}") do
      expect(page).to have_content("Hollywood")
      expect(page).to have_content("LA")
      expect(page).to have_content("Toy Story")
      expect(page).to have_content("2008")
      expect(page).to have_content("Fictional")
      expect(page).to have_content("Hulk")
      expect(page).to have_content("2010")
      expect(page).to have_content("Action")
    end
    within("#studio-#{@paramount.id}") do
      expect(page).to have_content("Paramount Studios")
      expect(page).to have_content("Culver City")
      expect(page).to have_content("Hunger Games")
      expect(page).to have_content("2012")
      expect(page).to have_content("Action")
      expect(page).to have_content("Dune")
      expect(page).to have_content("2021")
      expect(page).to have_content("Action")
    end
  end
end
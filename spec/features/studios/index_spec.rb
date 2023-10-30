require "rails_helper"

RSpec.describe "studio index page", type: :feature do
  describe "index displays all studios" do
    before :each do
      studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      studio2 = Studio.create!(name: "Disney", location: "Hollywood")

      movie1 = studio1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure")
      movie2 = studio2.movies.create!(title: "A New Hope", creation_year: 1977, genre: "Action/Adventure")
    end
    it "shows all studios" do
      
      
      # As a user,
      # When I visit the studio index page,
      visit "/studios"
      # Then I see all of the studios including name and location,
      expect(page).to have_content("Universal Studios")
      expect(page).to have_content("Disney")
      expect(page).to have_content("Hollywood")
      # And under each studio I see all of the studio's movies
      expect(page).to have_content("Raiders of the Lost Ark")
      
      expect(page).to have_content("A New Hope")
      
      # including the movie's title, creation year, and genre
      expect(page).to have_content("Raiders of the Lost Ark")
      expect(page).to have_content("1981")
      expect(page).to have_content("Action/Adventure")
      
      
      expect(page).to have_content("A New Hope")
      expect(page).to have_content("1977")
      expect(page).to have_content("Action/Adventure")
      
    end
  end
end
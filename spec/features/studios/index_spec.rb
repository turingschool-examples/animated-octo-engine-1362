require "rails_helper"

RSpec.describe "studio index page" do
  before(:each) do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Warner Brothers", location: "Los Angeles")

    @movie_1 = @studio_1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
    @movie_2 = @studio_1.movies.create!(title: "Toy Story 2", creation_year: "1999", genre: "animation")
    @movie_3 = @studio_2.movies.create!(title: "A Bug's Life", creation_year: "2001", genre: "animation")
  end

  describe "When I visit the studio index page" do
    it "I see all of the studios including name and location" do

      visit "/studios"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)

      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
    end

    it "And under each studio I see all of the studio's movies including the movie's title, creation year, and genre" do
     
      visit "/studios"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)


      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
      expect(page).to have_content(@movie_3.title)
      expect(page).to have_content(@movie_3.creation_year)
      expect(page).to have_content(@movie_3.genre)
      
    end
  end
end

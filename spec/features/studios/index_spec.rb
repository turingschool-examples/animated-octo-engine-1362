require "rails_helper"

RSpec.describe "Studio" do 
  before(:each) do
    @studio1 = Studio.create(name: "Lucasfilm", location: "Burbank, CA")
    @studio2 = Studio.create(name: "Conaco", location: "Hollywood, CA")
    @movie1 = @studio1.movies.create(title: "Star Wars", creation_year: "1977", genre: "Sci-fi")
    @movie2 = @studio1.movies.create(title: "Indiana Jones", creation_year: "1981", genre: "Adventure")
    @movie3 = @studio2.movies.create(title: "Hans and Frans Big Adventure", creation_year: "1993", genre: "Comedy")
    @movie4 = @studio2.movies.create(title: "The Year 2000", creation_year: "2003", genre: "Comedy")
  end

  it "has an index" do
    # Story 1 - Studio Index

    # As a user,
    # When I visit the studio index page,
      visit "/studios"
    # Then I see all of the studios including name and location,
      expect(page).to have_content(@studio1.name)
      expect(page).to have_content(@studio1.location)
      expect(page).to have_content(@studio2.name)
      expect(page).to have_content(@studio2.location)
      save_and_open_page
    # And under each studio I see all of the studio's movies
    # including the movie's title, creation year, and genre
      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie1.genre)
  end
end

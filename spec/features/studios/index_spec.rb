require "rails_helper"

RSpec.describe "As a user" do
  describe "When I visit the studio index page" do
    it "Then I see all of the studios including name and location, And under each studio I see all of the studio's movies including the movie's title, creation year, and genre" do
      @studio_1 = Studio.create(name: "Disney", location: "Hollywood")
      @studio_2 = Studio.create(name: "Universal", location: "Hollywood")
      @movie_1 = @studio_1.movies.create(title: "Star Wars: The Last Jedi", creation_year: "2017", genre: "Sci-fi")
      @movie_2 = @studio_2.movies.create(title: "Batman: The Killing Joke", creation_year: "2016", genre: "Animated")
      
      visit "/studios"

      expect(page).to have_content("Disney")
      expect(page).to have_content("Universal")
      expect(page).to have_content("Star Wars: The Last Jedi")
      expect(page).to have_content("Batman: The Killing Joke")
    end
  end
end
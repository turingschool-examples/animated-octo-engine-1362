require "rails_helper"

RSpec.describe "As a user" do
  describe "When I visit a movie's show page" do
    it "I see the movie's title, creation year, and genre, and a list of all its actors from youngest to oldest And I see the average age of all of the movie's actors" do
      @studio_1 = Studio.create(name: "Disney", location: "Hollywood")
      @movie_1 = @studio_1.movies.create(title: "Star Wars: The Last Jedi", creation_year: "2017", genre: "Sci-fi")
      @actor_1 = Actor.create(name: "Mark Hamill", age: 72)
      @actor_2 = Actor.create(name: "Adam Driver", age: 39)
      ActorMovie.create(movie: @movie_1, actor: @actor_1)
      ActorMovie.create(movie: @movie_1, actor: @actor_2)

      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content("Star Wars: The Last Jedi")
      expect(page).to have_content("2017")
      expect(page).to have_content("Sci-fi")
      expect(@actor_2.name).to appear_before(@actor_1.name)
    end
  end
end
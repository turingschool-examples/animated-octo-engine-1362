require "rails_helper"

RSpec.describe "studio#show" do
  before(:each) do
    @studio_1 = Studio.create!(name: "Paramount", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Fox Searchlight Pictures", location: "Los Angeles")
    @studio_3 = Studio.create!(name: "Mosfilm", location: "Moscow")

    @movie_1 = @studio_1.movies.create!(title: "Killers of the Flower Moon", creation_year: 2023, genre: "crime noir")
    @movie_2 = @studio_1.movies.create!(title: "The Truman Show", creation_year: 1998, genre: "drama")
    @movie_3 = @studio_2.movies.create!(title: "The Tree of Life", creation_year: 2011, genre: "drama")
    @movie_4 = @studio_2.movies.create!(title: "A Hidden Life", creation_year: 2019, genre: "drama")
    @movie_5 = @studio_3.movies.create!(title: "Stalker", creation_year: 1979, genre: "science fiction")
    @movie_6 = @studio_1.movies.create!(title: "The Untouchables", creation_year: 1987, genre: "crime noir")

    @actor_1 = Actor.create!(name: "Robert DeNiro", age: 80)
    @actor_2 = Actor.create!(name: "Leonardo DiCaprio", age: 48)
    @actor_3 = Actor.create!(name: "Lily Gladstone", age: 37)
    

    @movie_actor_1 = MovieActor.create!(movie: @movie_1, actor: @actor_1)
    @movie_actor_2 = MovieActor.create!(movie: @movie_1, actor: @actor_2)
    @movie_actor_3 = MovieActor.create!(movie: @movie_1, actor: @actor_3)
    @movie_actor_3 = MovieActor.create!(movie: @movie_6, actor: @actor_1)
  end
    # Extension
    # Studio's Actors
    
    # As a user,
    # When I visit a studio's show page
    # I see the studio's name and location
    # And I see a unique list of all of the actors that have worked on any of this studio's movies.

  describe "when I visit '/studios/:id'" do
    it "shows the studio's name and location" do
      visit "/studios/#{@studio_1.id}"

      expect(page).to have_content("#{@studio_1.name}'s Show Page")
      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
    end

    xit "shows a unique list of all the actors that have works on any of this studio's movies" do
      visit "/studios/#{@studio_1.id}"

      expect(page).to have_content("#{@studio_1.name}'s Show Page")
      expect(page).to have_content("Actors in our Pictures: #{@actor_1.name}, #{@actor_2.name}, #{@actor_3.name}")

    end

  end
end
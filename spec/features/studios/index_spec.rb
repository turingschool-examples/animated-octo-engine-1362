require "rails_helper"

RSpec.describe "studios#index" do
  before(:each) do
    @studio_1 = Studio.create!(name: "Paramount", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Fox Searchlight Pictures", location: "Los Angeles")
    @studio_3 = Studio.create!(name: "Mosfilm", location: "Moscow")

    @movie_1 = @studio_1.movies.create!(title: "Killers of the Flower Moon", creation_year: 2023, genre: "crime noir")
    @movie_2 = @studio_1.movies.create!(title: "The Truman Show", creation_year: 1998, genre: "drama")
    @movie_3 = @studio_2.movies.create!(title: "The Tree of Life", creation_year: 2011, genre: "drama")
    @movie_4 = @studio_2.movies.create!(title: "A Hidden Life", creation_year: 2019, genre: "drama")
    @movie_5 = @studio_3.movies.create!(title: "Stalker", creation_year: 1979, genre: "science fiction")
  end
  #   Story 1 - Studio Index

  # As a user,
  # When I visit the studio index page,
  # Then I see all of the studios including name and location,
  # And under each studio I see all of the studio's movies
  # including the movie's title, creation year, and genre
  describe "when I visit '/studios'" do
    it "shows all the studios including name and location" do
      visit "/studios"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)

      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)

      expect(page).to have_content(@studio_3.name)
      expect(page).to have_content(@studio_3.location)
    end

    it "under each studio it shows all the studio's movies
     with title, creation_year, and genre" do
      visit "/studios"

      within("#studio_movies-#{@studio_1.id}") do
        expect(page).to have_content(@movie_1.title)
        expect(page).to have_content(@movie_1.creation_year)
        expect(page).to have_content(@movie_1.genre)

        expect(page).to have_content(@movie_2.title)
        expect(page).to have_content(@movie_2.creation_year)
        expect(page).to have_content(@movie_2.genre)
      end

      within("#studio_movies-#{@studio_2.id}") do
        expect(page).to have_content(@movie_3.title)
        expect(page).to have_content(@movie_3.creation_year)
        expect(page).to have_content(@movie_3.genre)

        expect(page).to have_content(@movie_4.title)
        expect(page).to have_content(@movie_4.creation_year)
        expect(page).to have_content(@movie_4.genre)
      end

      within("#studio_movies-#{@studio_3.id}") do
        expect(page).to have_content(@movie_5.title)
        expect(page).to have_content(@movie_5.creation_year)
        expect(page).to have_content(@movie_5.genre)
      end
    end
  end
end
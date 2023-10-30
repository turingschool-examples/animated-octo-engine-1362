require "rails_helper"

RSpec.describe "studio index" do
  before :each do
    @studio_1 = Studio.create!(name: "MAPPA Studio", location: "Suginami")
    @studio_2 = Studio.create!(name: "UFO Table", location: "Shibuya")

    @movie_1 = @studio_1.movies.create!(title: "Jujutsu Kaisen", creation_year: "2018", genre: "Adventure Dark", studio_id: @studio_1.id)
    @movie_2 = @studio_1.movies.create!(title: "Attack on Titan", creation_year: "2013", genre: "Action Dark", studio_id: @studio_1.id)

    @movie_3 = @studio_2.movies.create!(title: "Demon Slayer", creation_year: "2016", genre: "Action Fantasy", studio_id: @studio_2.id)
    @movie_4 = @studio_2.movies.create!(title: "Fate/Zero", creation_year: "2011", genre: "Dark fantasy", studio_id: @studio_2.id)
  end

  describe "US 1- Studio Index Page" do
    describe "When i visit the studip index page I see all the studios and their info" do
      it "Also displays all their movies and their moveis info" do
        visit "/studios"

        expect(page).to have_content(@studio_1.name)
        expect(page).to have_content(@studio_1.location)
        expect(page).to have_content(@studio_2.name)
        expect(page).to have_content(@studio_2.location)

        expect(page).to have_content(@movie_1.title)
        expect(page).to have_content(@movie_1.creation_year)
        expect(page).to have_content(@movie_1.genre)

        expect(page).to have_content(@movie_2.title)
        expect(page).to have_content(@movie_2.creation_year)
        expect(page).to have_content(@movie_2.genre)

        expect(page).to have_content(@movie_3.title)
        expect(page).to have_content(@movie_3.creation_year)
        expect(page).to have_content(@movie_3.genre)

        expect(page).to have_content(@movie_4.title)
        expect(page).to have_content(@movie_4.creation_year)
        expect(page).to have_content(@movie_4.genre)
      end
    end
  end
end

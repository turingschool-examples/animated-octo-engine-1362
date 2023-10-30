require "rails_helper"

RSpec.describe "the studio index page" do
  before (:each) do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Ramoji Film City", location: "India")
    @movie_1 = @studio_1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
    @movie_2 = @studio_1.movies.create!(title: "Mystery Men", creation_year: "1999", genre: "action")
    @movie_3 = @studio_2.movies.create!(title: "RRR", creation_year: "2022", genre: "action")
    @movie_4 = @studio_2.movies.create!(title: "Aadhi", creation_year: "2018", genre: "thriller")
  end
  
  it "displays all studio names, locations, and movie details" do
    visit "/studios"

    within("section##{@studio_1.id}") do
      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)
      expect(page).to have_content(@movie_2.title)
      expect(page).to have_content(@movie_2.creation_year)
      expect(page).to have_content(@movie_2.genre)
      expect(page).to_not have_content(@movie_3.title)
    end
  end
end
require "rails_helper"

RSpec.describe "the studio show page" do
  before (:each) do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Ramoji Film City", location: "India")
    @movie_1 = @studio_1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
    @movie_2 = @studio_1.movies.create!(title: "Mystery Men", creation_year: "1999", genre: "action")
    @movie_3 = @studio_2.movies.create!(title: "RRR", creation_year: "2022", genre: "action")
    @movie_4 = @studio_2.movies.create!(title: "Aadhi", creation_year: "2018", genre: "thriller")
    @actor_1 = @movie_1.actors.create!(name: "Tim Allen", age: 70)
    @actor_2 = @movie_1.actors.create!(name: "Tom Hanks", age: 67)
    @actor_3 = @movie_2.actors.create!(name: "Ben Stiller", age: 57)
    @actor_4 = @movie_3.actors.create!(name: "N.T. Rama Rao Jr.", age: 40)
  end
  
  it "displays the studio's name and location" do
    visit "/studios/#{@studio_1.id}"

    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_1.location)
  end

  it "displays a unique list of all actors that have worked on the studio's movies" do
    visit "/studios/#{@studio_1.id}"
save_and_open_page
    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)
    expect(page).to have_content(@actor_3.name)
    expect(page).to_not have_content(@actor_4.name)
  end
end
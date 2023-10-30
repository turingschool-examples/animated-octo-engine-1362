require "rails_helper"

RSpec.describe "movie show page", type: :feature do
  it "shows movie title, creation year, and genre" do
    studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    movie1 = studio1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure")
    
    visit "/movies/#{movie1.id}"
    
    expect(page).to have_content("Raiders of the Lost Ark")
    expect(page).to have_content("1981")
    expect(page).to have_content("Action/Adventure")
  end

  it "shows all actors in the movie" do
    studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    movie1 = studio1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure")
    actor1 = Actor.create!(name: "Harrison Ford", age: 78)
    actor2 = Actor.create!(name: "Karen Allen", age: 69)
    actor3 = Actor.create!(name: "Paul Freeman", age: 79)
    ActorMovie.create!(actor: actor1, movie: movie1)
    ActorMovie.create!(actor: actor2, movie: movie1)
    ActorMovie.create!(actor: actor3, movie: movie1)

    visit "/movies/#{movie1.id}"
    
    expect(page).to have_content("Karen Allen")
    expect(page).to have_content("Harrison Ford")
    expect(page).to have_content("Paul Freeman")

    expect(page).to have_content("Average Age: 75")
  end
end
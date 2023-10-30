require "rails_helper"

RSpec.describe "the movie show page" do
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
  end
  
  it "displays all studio name, locations, and movie details" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)
  end

  it "displays actors ordered from youngest to oldest and average actor age" do
    visit "/movies/#{@movie_1.id}"

    expect(@actor_2.name).to appear_before(@actor_1.name)
    expect(page).to have_content("Average Actor Age: 68.5 years")
  end

  it "allows an actor to be added to the movie by submitting the actor's id" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to_not have_content(@actor_3.name)
    
    fill_in "actor_id", with: "#{@actor_3.id}"
    click_button "submit"

    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content(@actor_3.name)
  end
end
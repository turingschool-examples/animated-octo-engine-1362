require "rails_helper"

RSpec.describe "Movie Show Page", type: :feature do
  before :each do
    # Studios
    @hollywood = Studio.create!(name: "Hollywood", location: "LA")
    @paramount = Studio.create!(name: "Paramount Studios", location: "Culver City")

    # Movies belonging to a studio
    @TS = @hollywood.movies.create!(title: "Toy Story", creation_year: "2008", genre: "Fictional")
    @Hulk = @hollywood.movies.create!(title: "Hulk", creation_year: "2010", genre: "Action")

    @Dune = @paramount.movies.create!(title: "Dune", creation_year: "2021", genre: "Action")
    @HungerGames = @paramount.movies.create!(title: "Hunger Games", creation_year: "2012", genre: "Action")
  
    # Actors
    @woody = Actor.create!(name: "Woody", age: 10)
    @buzz = Actor.create!(name: "Buzz", age: 8)
    @piggy = Actor.create!(name: "Piggy", age: 9)

    @ryangosling = Actor.create!(name: "Ryan Gosling", age: 40)

    # Actors starring in a Movie
    MovieActor.create!(movie: @TS, actor: @woody)
    MovieActor.create!(movie: @TS, actor: @buzz)
    MovieActor.create!(movie: @TS, actor: @piggy)
  end

  # US 2
  it "displays the movie attributes and a list of actors ordered by age" do
    visit "/movies/#{@TS.id}"

    expect(page).to have_content("Toy Story")
    expect(page).to have_content("2008")
    expect(page).to have_content("Fictional")
    expect(page).to have_content("Buzz, Piggy, Woody")
    expect(page).to have_content("Average Age: 9")
  end

  # US 3
  it "displays a link to redirect to a form to add a new actor" do
    visit "/movies/#{@TS.id}"

    expect(page).to_not have_content("Ryan Gosling")

    fill_in "actor_id", with: @ryangosling.id

    click_button("Add Actor")

    expect(current_path).to eq("/movies/#{@TS.id}")

    expect(page).to have_content("Ryan Gosling")
  end
end
require "rails_helper"

RSpec.describe "Movies show pages" do
  before(:each) do
    @universal = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @sony = Studio.create!(name: "Sony Pictures", location: "Culver City")
    @bourne = @universal.movies.create!(title: "Jason Bourne", creation_year: "2002", genre: "action")
    @spiderman = @sony.movies.create!(title: "Spider-Man", creation_year: 2023, genre: "action")
    @smoore = Actor.create!(name: "Shameik Moore", age: 28)
    @hsteinfeld = Actor.create!(name: "Hailee Steinfeld", age: 26)
    @mdamon = Actor.create!(name: "Matt Damon", age: 53)
    @jjohnson = Actor.create!(name: "Jake Johnson", age: 45)
    MovieActor.create!(movie_id: @spiderman.id, actor_id: @smoore.id)
    MovieActor.create!(movie_id: @spiderman.id, actor_id: @hsteinfeld.id)
    MovieActor.create!(movie_id: @bourne.id, actor_id: @mdamon.id)
  end

  it "shows the title, creation, genre, and all actors from youngest to oldest" do
    # Story 2 - Movie Show
    #
    # As a user,
    # When I visit a movie's show page.
    # I see the movie's title, creation year, and genre,
    # and a list of all its actors from youngest to oldest.
    # And I see the average age of all of the movie's actors
    visit "/movies/#{@spiderman.id}"

    expect(page).to have_content @spiderman.title
    expect(page).to have_content @spiderman.creation_year
    expect(page).to have_content @spiderman.genre

    expect(@hsteinfeld.name).to appear_before @smoore.name
    expect(page).to_not have_content @mdamon.name
  end

  it "shows the average age of all actors" do
    visit "/movies/#{@spiderman.id}"

    expect(page).to have_content "Average Age: 27.0"
  end

  it "has a form to add an actor to the movie" do
    # Story 3
    # Add an Actor to a Movie
    #
    # As a user,
    # When I visit a movie show page,
    # I do not see any actors listed that are not part of the movie
    # And I see a form to add an actor to this movie
    # When I fill in the form with the ID of an actor that exists in the database
    # And I click submit
    # Then I am redirected back to that movie's show page
    # And I see the actor's name is now listed
    # (You do not have to test for a sad path, for example if the id submitted is not an existing actor)
    visit "movies/#{@spiderman.id}"
    
    fill_in "Add Actor by ID", with: @jjohnson.id
    click_button "Add Actor"
    
    expect(page).to have_content @jjohnson.name
    expect(page).to have_content "Average Age: 33.0"
  end
end
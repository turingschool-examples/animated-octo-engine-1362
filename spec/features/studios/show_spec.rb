require "rails_helper"

RSpec.describe "Studios show pages" do
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

  it "shows studios location and all the actors that have worked for studio" do
    # Extension
    # Studio's Actors
    #
    # As a user,
    # When I visit a studio's show page
    # I see the studio's name and location
    # And I see a unique list of all of the actors that have worked on any of this studio's movies.
    visit "/studios/#{@sony.id}"

    expect(page).to have_content @sony.name
    expect(page).to have_content @sony.location

    expect(page).to have_content @smoore.name
    expect(page).to have_content @hsteinfeld.name
  end

end

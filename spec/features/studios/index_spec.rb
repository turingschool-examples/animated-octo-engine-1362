require "rails_helper"

RSpec.describe "Studios Index" do
  before(:each) do
    @universal = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @sony = Studio.create!(name: "Sony Pictures", location: "Culver City")
    @bourne = @universal.movies.create!(title: "Jason Bourne", creation_year: "2002", genre: "action")
    @spiderman = @sony.movies.create!(title: "Spider Man", creation_year: 2023, genre: "action")
  end

  it "shows all studios, location, and movies" do
    # Story 1 - Studio Index
    #
    # As a user,
    # When I visit the studio index page,
    # Then I see all of the studios including name and location,
    # And under each studio I see all of the studio's movies
    # including the movie's title, creation year, and genre
    visit "/studios"

    expect(page).to have_content "Universal Studios"
    expect(page).to have_content "Jason Bourne"
    expect(page).to have_content "Sony Pictures"
    expect(page).to have_content "Spider Man"
  end
end
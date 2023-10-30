require "rails_helper"

RSpec.describe "Movie's Show Page" do

  # As a user,
  # When I visit a movie's show page.
  visit "/movies/#{movie.id}"
  # I see the movie's title, creation year, and genre,
  expect(page).to have_content()
  # and a list of all its actors from youngest to oldest.
  # And I see the average age of all of the movie's actors
end
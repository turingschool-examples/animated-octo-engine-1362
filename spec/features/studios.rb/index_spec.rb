require "rails_helper"

RSpec.describe "the studio index" do
  it "lists all the studios with their attributes" do
    universal = Studio.create!(name: "Universal Studios", location: "Los Angeles")
    a24 = Studio.create!(name: "A24", location: "New York")
    movies = universal.movies.create!([{ title: "Star Wars", creation_year: "1979", genre: "sci-fi" }, { title: "Lord of the Rings", creation_year: "2000", genre: "fantasy" }])
    movies = a24.movies.create!([{ title: "Hereditary", creation_year: "2017", genre: "horror" }, { title: "Swiss Army Man", creation_year: "2016", genre: "drama" }])
    visit "/studios"

    expect(page).to have_content(universal.name)
    expect(page).to have_content(a24.name)
   
    expect(page).to have_content(universal.location)
    expect(page).to have_content(a24.location)

    within('section', :text => "Universal") do
      expect(page).to have_content("Star Wars")
      expect(page).to have_content("1979")
      expect(page).to have_content("sci-fi")

      expect(page).to have_content("Lord of the Rings")
      expect(page).to have_content("2000")
      expect(page).to have_content("fantasy")
    end

    within('section', :text => "A24") do
      expect(page).to have_content("Hereditary")
      expect(page).to have_content("2017")
      expect(page).to have_content("horror")


      expect(page).to have_content("Swiss Army Man")
      expect(page).to have_content("2016")
      expect(page).to have_content("drama")
    end
  end
end
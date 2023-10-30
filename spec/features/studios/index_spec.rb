require "rails_helper"

RSpec.describe "Studio Index Page" do
  it "displays all the studios name's and locations" do
    universal_studios = Studio.create!(name: "Universal Studios", location: "Hollywood")
    disney = Studio.create!(name: "Disney", location: "Hollywood")
    fox_studios = Studio.create!(name: "Fox Studios", location: "Hollywood")

    tfatf = universal_studios.movies.create!(title: "The Fast and the Furious", creation_year: "2001", genre: "action")    # As a user,
    shrek = universal_studios.movies.create!(title: "Shrek", creation_year: "2002", genre: "animated")
  
    star_wars = disney.movies.create!(title: "A New Hope", creation_year: "1979", genre: "sci-fi")
    avengers = disney.movies.create!(title: "End Game", creation_year: "2019", genre: "action")
        
    ice_age = fox_studios.movies.create!(title: "Ice Age", creation_year: "2006", genre: "animated")
    avatar = fox_studios.movies.create!(title: "Avatar", creation_year: "2009", genre: "sci-fi")
    # As a user,
    # When I visit the studio index page,
    visit "/studios"
    # Then I see all of the studios including name and location,
    expect(page).to have_content("Universal Studios")
    expect(page).to have_content("Hollywood")
    expect(page).to have_content("Disney")
    expect(page).to have_content("Hollywood")
    expect(page).to have_content("Fox Studios")
    expect(page).to have_content("Hollywood")
    # And under each studio I see all of the studio's movies
    # including the movie's title, creation year, and genre
    save_and_open_page
    within "#studio-#{universal_studios.id}" do
      expect(page).to have_content("Title: The Fast and the Furious")
      expect(page).to have_content("Year: 2001")
      expect(page).to have_content("Genre: action")
      expect(page).to have_content("Title: Shrek")
      expect(page).to have_content("Year: 2001")
      expect(page).to have_content("Genre: animated")
    end

    within "#studio-#{disney.id}" do
      expect(page).to have_content("Title: A New Hope")
      expect(page).to have_content("Year: 1979")
      expect(page).to have_content("Genre: sci-fi")
      expect(page).to have_content("Title: End Game")
      expect(page).to have_content("Year: 2019")
      expect(page).to have_content("Genre: action")
    end

    within "#studio-#{fox_studios.id}" do
      expect(page).to have_content("Title: Ice Age")
      expect(page).to have_content("Year: 2006")
      expect(page).to have_content("Genre: animated")
      expect(page).to have_content("Title: Avatar")
      expect(page).to have_content("Year: 2009")
      expect(page).to have_content("Genre: sci-fi")
    end
  end
end
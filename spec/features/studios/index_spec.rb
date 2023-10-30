require 'rails_helper'

RSpec.describe "studio index", type: :feature do
  before (:each) do
    @disney = Studio.create!(name: "Disney", location: "Burbank")
    @pixar = Studio.create!(name: "Pixar", location: "Emeryville")
    @universal = Studio.create!(name: "Universal", location: "Universal City")

    @elemental = @disney.movies.create!(title: "Elemental", creation_year: 2023, genre: "Family")
    @mermaid = @disney.movies.create!(title: "Little Mermaid", creation_year: 1980, genre: "Fantasy")
    @turning_red = @pixar.movies.create!(title: "Turning Red", creation_year: 2022, genre: "Family")
    @toy_story = @pixar.movies.create!(title: "Toy Story", creation_year: 2002, genre: "Comedy")
    @shrek = @universal.movies.create!(title: "Shrek", creation_year: 2012, genre: "Comedy")
    @dragon = @universal.movies.create!(title: "Turning Red", creation_year: 2020, genre: "Fantasy")




  end

  it 'lists all of the studios, including name and location' do
    # When I visit the studio index page,
    visit "/studios"
    # Then I see all of the studios including name and location,
    expect(page).to have_content(@disney.name)
    expect(page).to have_content(@pixar.name)
    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@disney.location)
    expect(page).to have_content(@pixar.location)
    expect(page).to have_content(@universal.location)
  end
  
  it 'displays each movie associated with the studio' do
    #     And under each studio I see all of the studio's movies
    # including the movie's title, creation year, and genre
    visit "/studios"
    save_and_open_page
    within("section#studio-#{@disney.id}") do
      expect(page).to have_content(@elemental.title)
      expect(page).to have_content(@mermaid.title)
    end 
    within("section#studio-#{@pixar.id}") do
      expect(page).to have_content(@turning_red.title)
      expect(page).to have_content(@toy_story.title)
    end  
    within("section#studio-#{@universal.id}") do
      expect(page).to have_content(@shrek.title)
      expect(page).to have_content(@dragon.title)
    end
    #make within tests
  
  end
end
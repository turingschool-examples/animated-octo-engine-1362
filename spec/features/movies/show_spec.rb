require 'rails_helper'

RSpec.describe "movies show", type: :feature do
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

    @actor1 = Actor.create!(name: "a actor", age: 25)
    @actor2 = Actor.create!(name: "b actor", age: 29)
    @actor3 = Actor.create!(name: "c actor", age: 49)
    @actor4 = Actor.create!(name: "d actor", age: 13)
    @actor5 = Actor.create!(name: "e actor", age: 35)
    @actor6 = Actor.create!(name: "f actor", age: 12)
    @actor7 = Actor.create!(name: "g actor", age: 87)
    @actor8 = Actor.create!(name: "h actor", age: 50)
    @actor9 = Actor.create!(name: "i actor", age: 65)

    @elemental.actors << @actor1
    @elemental.actors << @actor2
    @elemental.actors << @actor3
    @mermaid.actors << @actor3
    @mermaid.actors << @actor4
    @mermaid.actors << @actor5
    @turning_red.actors << @actor6
    @turning_red.actors << @actor7
    @turning_red.actors << @actor8
    @toy_story.actors << @actor9
    @toy_story.actors << @actor1
    @shrek.actors << @actor2
    @shrek.actors << @actor3
    @shrek.actors << @actor4
    @dragon.actors << @actor5
    @dragon.actors << @actor6
    @dragon.actors << @actor1
    @dragon.actors << @actor7
  end
  it 'displays the title, creation year, and genre' do
    visit "/movies/#{@elemental.id}"
    expect(page).to have_content(@elemental.title)
    expect(page).to have_content(@elemental.creation_year)
    expect(page).to have_content(@elemental.genre)

  end
  
  it 'shows all actors from oldest to youngest' do
    visit "/movies/#{@dragon.id}"
    # save_and_open_page
    expect(@actor7.name).to appear_before(@actor5.name)
    expect(@actor5.name).to appear_before(@actor1.name)
    expect(@actor1.name).to appear_before(@actor6.name)
    expect(@actor7.name).to appear_before(@actor1.name)
    
  end
  
  it 'tells average age of the actors' do
    visit "/movies/#{@shrek.id}"
    average_age = (@actor2.age + @actor3.age + @actor4.age) / 3
    expect(page).to have_content("Average Age of Actors: #{average_age}")
  end

  it 'has a form to add an actor' do
    visit "movies/#{@turning_red.id}"
    expect(page).to_not have_content(@actor1.name)
    fill_in "Add actor", with: "#{@actor1.id}"
    click_button "Submit"
    expect(current_path).to eq("/movies/#{@turning_red.id}")
    expect(page).to have_content(@actor1.name)
  end
end
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

    @actor1 = Actor.create!(name: "a actor", age: "25")
    @actor2 = Actor.create!(name: "b actor", age: "29")
    @actor3 = Actor.create!(name: "c actor", age: "49")
    @actor4 = Actor.create!(name: "d actor", age: "13")
    @actor5 = Actor.create!(name: "e actor", age: "35")
    @actor6 = Actor.create!(name: "f actor", age: "12")
    @actor7 = Actor.create!(name: "g actor", age: "87")
    @actor8 = Actor.create!(name: "h actor", age: "50")
    @actor9 = Actor.create!(name: "i actor", age: "65")

    @elemental.actors << @actor1
    @elemental.actors << @actor2
    @elemental.actors << @actor3
    @mermaid.actors << @actor3
    @mermaid.actors << @actor3
    @mermaid.actors << @actor3
    @turning_red.actors << @actor3
    @turning_red.actors << @actor3
    @turning_red.actors << @actor3
    @toy_story.actors << @actor3
    @toy_story.actors << @actor3
    @shrek.actors << @actor3
    @shrek.actors << @actor3
    @shrek.actors << @actor3
    @dragon.actors << @actor3
    @dragon.actors << @actor3
    @dragon.actors << @actor3
    @dragon.actors << @actor3
  end
  it 'displays the title, creation year, and genre' do
    visit "/movies/#{@disney.id}"
  end
  xit 'shows all actors from oldest to youngest' do
    visit "/movies/#{@pixar.id}"
    
  end
  
  xit 'tells average age of the actors' do
    visit "/movies/#{@universal.id}"

  end
end
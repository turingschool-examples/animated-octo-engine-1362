require 'rails_helper'

RSpec.describe "studio show", type: :feature do
  before (:each) do
    @disney = Studio.create!(name: "Disney", location: "Burbank")

    @elemental = @disney.movies.create!(title: "Elemental", creation_year: 2023, genre: "Family")
    @mermaid = @disney.movies.create!(title: "Little Mermaid", creation_year: 1980, genre: "Fantasy")

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
    @elemental.actors << @actor4
    @elemental.actors << @actor5
    @mermaid.actors << @actor5
    @mermaid.actors << @actor6
    @mermaid.actors << @actor7
    @mermaid.actors << @actor8
    @mermaid.actors << @actor9
    
  end

  it 'shows the name and location of the studio' do
    visit "/studios/#{@disney.id}"

    expect(page).to have_content(@disney.name)
    expect(page).to have_content(@disney.location)
  end

  it 'shows a list of the actors associated with the studio' do 
    visit "/studios/#{@disney.id}"
    save_and_open_page
    expect(page).to have_content(@actor1.name)
    expect(page).to have_content(@actor2.name)
    expect(page).to have_content(@actor3.name)
    expect(page).to have_content(@actor4.name)
    expect(page).to have_content(@actor5.name)
    expect(page).to have_content(@actor6.name)
    expect(page).to have_content(@actor7.name)
    expect(page).to have_content(@actor8.name)
    expect(page).to have_content(@actor9.name)
  end
end
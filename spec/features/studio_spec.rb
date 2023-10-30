require "rails_helper"

RSpec.describe Studio do
  before(:each) do
    @studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio2 = Studio.create!(name: "Disney", location: "Orlando")
    @studio3 = Studio.create!(name: "Underground", location: "New York")

    @movie1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "animation", studio: @studio1)
    @movie2 = Movie.create!(title: "Django", creation_year: "2019", genre: "comedy", studio: @studio3)
    @movie3 = Movie.create!(title: "Mission Impossible", creation_year: "2015", genre: "action", studio: @studio1)
    @movie4 = Movie.create!(title: "Barbie", creation_year: "2023", genre: "comedy", studio: @studio1)
    @movie5 = Movie.create!(title: "Oppenheimer", creation_year: "2023", genre: "documentary", studio: @studio1)
    @movie6 = Movie.create!(title: "frozen", creation_year: "2012", genre: "animation", studio: @studio2)

    @actor1 = Actor.create!(name: "Meryl Streep", age: 73)
    @actor2 = Actor.create!(name: "Tom Hanks", age: 64)
    @actor3 = Actor.create!(name: "Morgan Freeman", age: 82)
    @actor4 = Actor.create!(name: "Jack Black", age: 56)
    @actor5 = Actor.create!(name: "Margot Robbie", age: 33)
  end

  it 'Creates studio index' do
    visit "/studios"

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio1.location)
    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie3.title)
    expect(page).to have_content(@movie4.title)
    expect(page).to have_content(@movie5.title)

    expect(page).to have_content(@studio2.name)
    expect(page).to have_content(@studio2.location)
    expect(page).to have_content(@movie6.title)

    expect(page).to have_content(@studio3.name)
    expect(page).to have_content(@studio3.location)
    expect(page).to have_content(@movie2.title)
  end

  it 'When I visit a studio show page I see attributes and list of all actors' do
    @movie4.actors << @actor5
    @movie4.actors << @actor4
    @movie4.actors << @actor3

    @movie5.actors << @actor2
    @movie5.actors << @actor1

    visit "/studios/#{@studio1.id}"

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio1.location)

    expect(page).to have_content("Contributing Actors")

    within("div#cont_act") do
      expect(page).to have_content(@actor1.name)
      expect(page).to have_content(@actor2.name)
      expect(page).to have_content(@actor3.name)
      expect(page).to have_content(@actor4.name)
      expect(page).to have_content(@actor5.name)
    end 
  end
end
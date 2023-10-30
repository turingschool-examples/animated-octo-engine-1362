require 'rails_helper'

RSpec.describe 'new movie actor page' do
  before :each do
    @universal = Studio.create!(name: "Universal Studios", location: "Los Angeles")
    @a24 = Studio.create!(name: "A24", location: "New York")
    @star_wars = Movie.create!(title: "Star Wars", creation_year: "1979", genre: "sci-fi", studio_id: @universal.id)
    @lord = Movie.create!(title: "Lord of the Rings", creation_year: "2000", genre: "fantasy", studio_id: @universal.id)
    @hereditary = Movie.create!(title: "Hereditary", creation_year: "2017", genre: "horror", studio_id: @a24.id)
    @swiss = Movie.create!(title: "Swiss Army Man", creation_year: "2016", genre: "drama", studio_id: @a24.id)
    @hereditary.actors.create!([{name: "Toni Collette", age: 42}, {name: "Alex Wolff", age: 27}, {name: "Milly Shapiro", age: 29}])
    @swiss.actors.create!([{name: "Paul Dano", age: 32}, {name: "Daniel Radcliffe", age: 34}, {name: "Mary Elizabeth Winstead", age: 24}])
  end

  it "can create a new actor for a movie" do
    visit "/movies/#{@swiss.id}"

    expect(page).to_not have_content("Marika Casteel")

    click_link("Add an actor to this movie")
    
    fill_in "name", with: "Marika Casteel"
    fill_in "age", with: "37"

    expect(page).to have_button

    click_button

    expect(current_path).to eq("/movies/#{@swiss.id}")
    expect(page).to have_content("Marika Casteel")
    expect(page).to have_content(37)
    expect(page).to have_content(31.75)
  end
end
require "rails_helper"

RSpec.describe "Show" do 
  before :each do 
    @pixar = Studio.create!(name: "Pixar Studios", location: "Hollywood")
    @toy_1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "Animation", studio_id: @pixar.id)
    @hanks = Actor.create!(name: "Tom Hanks", age: 42)
    @allen = Actor.create!(name: "Tim Allen", age: 41)
    @reeves = Actor.create!(name: "Keanu Reeves", age: 40)

    MovieActor.create!(movie_id: @toy_1.id, actor_id: @hanks.id)
    MovieActor.create!(movie_id: @toy_1.id, actor_id: @allen.id)
    MovieActor.create!(movie_id: @toy_1.id, actor_id: @reeves.id)
  end

  it "shows a movies attributes and their actors" do 
    visit "/movies/#{@toy_1.id}"

    expect(page).to have_content("Movie Show Page")
    expect(page).to have_content(@toy_1.title)
    expect(page).to have_content(@toy_1.creation_year)
    expect(page).to have_content(@toy_1.genre)
  end
end 

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

    expect(page).to have_content(@hanks.name)
    expect(page).to have_content(@hanks.age)
    expect(page).to have_content(@allen.name)
    expect(page).to have_content(@allen.age)
    expect(page).to have_content(@reeves.name)
    expect(page).to have_content(@reeves.age)

    expect(@reeves.name).to appear_before(@allen.name)
    expect(@allen.name).to appear_before(@hanks.name)

    expect(page).to have_content("Actors Average Age:")
    expect(Actor.average_age).to eq(41.0)
  end

  it "has a search feature to add new actors to movies" do 
    visit "/movies/#{@toy_1.id}"

    expect(page).to have_content("Add a Actor to this Movie:")
    expect(page).to have_field("Enter actor name")
    expect(page).to have_button("Add Actor")
  end

  it "searches and adds a new actor to a movie" do 
    pratt = Actor.create!(name: "Chris Pratt", age: 35)

    visit "/movies/#{@toy_1.id}"

    fill_in "Enter actor name", with: "Chris Pratt"
    click_button "Add Actor" 

    expect(current_path).to eq("/movies/#{@toy_1.id}")
    expect(page).to have_content("Chris Pratt")
    expect(Actor.average_age).to eq(39.5)
    save_and_open_page
  end 
end 

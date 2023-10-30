require "rails_helper"

RSpec.describe "the movies show page" do
  before(:each) do
    @ghibli = Studio.create!(name: "Studio Ghibli", location: "Tokyo")
    @mononoke = @ghibli.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Action")
    @mononoke_actor = @mononoke.actors.create!(name: "John DiMaggio", age: 45)
    @mononoke_actress = @mononoke.actors.create!(name: "Claire Danes", age: 37)
    @new_actor = Actor.create!(name: "Joseph Lee", age: 26)
  end

  it "shows the employee's name, department, and list of tickets from oldest to newest" do
    visit "/movies/#{@mononoke.id}"
    expect(page).to have_content("#{@mononoke.title} - #{@mononoke.creation_year} - #{@mononoke.genre}")
    expect(page).to have_content("Cast")
    expect(page).to have_content(@mononoke_actor.name)
    expect(page).to have_content(@mononoke_actress.name)
    expect(@mononoke_actress.name).to be < @mononoke_actor.name
    expect(page).to have_content("Average Age of Cast: 41.0 years")
  end

  it "shows a form to add an actor/actress to the movie" do
    visit "/movies/#{@mononoke.id}"
    expect(page).to have_button("Search")
  end

  it "adds the searched actor/actress to the movie and calculates average age accordingly" do
    visit "/movies/#{@mononoke.id}"

    fill_in "Search", with: "#{@new_actor.id}"
    click_on("Search")

    expect(current_path).to eq("/movies/#{@mononoke.id}")
    expect(page).to have_content(@new_actor.name)
    expect(page).to have_content(@new_actor.age)
    #these lines under just indicate that "Joseph Lee" should appear before the other two cast members' names
    #which then validates that the #order_actors method is working and showing the cast ordered in the view as it should
    expect(page).to have_content(/#{@new_actor.name}.*#{@mononoke_actor.name}/)
    expect(page).to have_content(/#{@new_actor.name}.*#{@mononoke_actress.name}/)
    expect(page).to have_content("Average Age of Cast: 36.0 years")
  end
end

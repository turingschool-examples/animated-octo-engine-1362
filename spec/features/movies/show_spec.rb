require "rails_helper"

RSpec.describe "the movies show page" do
  before(:each) do
    @ghibli = Studio.create!(name: "Studio Ghibli", location: "Tokyo")
    @mononoke = @ghibli.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Action")
    @mononoke_actor = @mononoke.actors.create!(name: "John DiMaggio", age: 45)
    @mononoke_actress = @mononoke.actors.create!(name: "Claire Danes", age: 37)
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
end

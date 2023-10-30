require "rails_helper"

RSpec.describe "the studios index" do
  before(:each) do
    @ghibli = Studio.create!(name: "Studio Ghibli", location: "Tokyo")
    @A24 = Studio.create!(name: "A24", location: "New York City")
    @universal = Studio.create!(name: "Universal Pictures", location: "Hollywood")
    @walt_disney = Studio.create!(name: "Walt Disney", location: "Burbank")

    @mononoke = @ghibli.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Action")
    @spirited_away = @ghibli.movies.create!(title: "Spirited Away", creation_year: 2001, genre: "Adventure")
    @uncut_gems = @A24.movies.create!(title: "Uncut Gems", creation_year: 2019, genre: "Crime/Thriller")
    @talk_to_me = @A24.movies.create!(title: "Talk To Me", creation_year: 2022, genre: "Supernatural/Horror")
    @jurassic = @universal.movies.create!(title: "Jurassic World", creation_year: 2015, genre: "Science Fiction")
    @ex_machina = @universal.movies.create!(title: "Ex-Machina", creation_year: 2014, genre: "Science Fiction/Psychological Thriller")
    @ralph = @walt_disney.movies.create!(title: "Wreck It Ralph", creation_year: 2012, genre: "Comedy")
    @frozen = @walt_disney.movies.create!(title: "Frozen", creation_year: 2013, genre: "Musical Fantasy")
  end

  it "lists all departments' name, floor, and employees in the dept" do
    visit "/studios"

    expect(page).to have_content("All Studios and Movies")

    expect(page).to have_content("#{@ghibli.name} - #{@ghibli.location}")
    expect(page).to have_content("#{@A24.name} - #{@A24.location}")
    expect(page).to have_content("#{@universal.name} - #{@universal.location}")
    expect(page).to have_content("#{@walt_disney.name} - #{@walt_disney.location}")

    expect(page).to have_content("#{@mononoke.title} - #{@mononoke.creation_year} - #{@mononoke.genre}")
    expect(page).to have_content("#{@spirited_away.title} - #{@spirited_away.creation_year} - #{@spirited_away.genre}")
    expect(page).to have_content("#{@uncut_gems.title} - #{@uncut_gems.creation_year} - #{@uncut_gems.genre}")
    expect(page).to have_content("#{@talk_to_me.title} - #{@talk_to_me.creation_year} - #{@talk_to_me.genre}")
    expect(page).to have_content("#{@jurassic.title} - #{@jurassic.creation_year} - #{@jurassic.genre}")
    expect(page).to have_content("#{@ex_machina.title} - #{@ex_machina.creation_year} - #{@ex_machina.genre}")
    expect(page).to have_content("#{@ralph.title} - #{@ralph.creation_year} - #{@ralph.genre}")
    expect(page).to have_content("#{@frozen.title} - #{@frozen.creation_year} - #{@frozen.genre}")
  end
end

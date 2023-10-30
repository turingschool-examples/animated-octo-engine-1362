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
end
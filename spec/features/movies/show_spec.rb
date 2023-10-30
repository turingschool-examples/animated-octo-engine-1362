require 'rails_helper'

RSpec.describe "Movie Show Page" do
  before(:each) do
    test_data
  end

describe '#Movie Show Page - US 2' do
  it 'when visiting a movie show page, will show movie title, creation year, and genre' do
    visit "/movies/#{@totoro.id}"
    expect(page).to have_content(@totoro.title)
    expect(page).to have_content(@totoro.creation_year)
    expect(page).to have_content(@totoro.genre)
  end

  xit "also lists the actors from youngest to oldest" do
    visit "/movies/#{@totoro.id}"
    expect(@sootsprite.name).to appear_before(@mini_totoro.name)
    expect(@mini_totoro.name).to appear_before(@catbus.name)
  end

  xit "returns the average age of all actors separately" do
    visit "/movies/#{@totoro.id}"
    average_age =  @totoro.actors.pluck(:age).average
    expect(page).to appear_before(@mini_totoro.name)
  end
end

end
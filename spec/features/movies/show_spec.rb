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

    it "also lists the actors from youngest to oldest" do
      visit "/movies/#{@totoro.id}"
      expect(@sootsprite.name).to appear_before(@mini_totoro.name)
      expect(@mini_totoro.name).to appear_before(@catbus.name)
    end

    it "returns the average age of all actors separately" do
      visit "/movies/#{@totoro.id}"
      average_age =  @totoro.actors.pluck(:age).sum.div(@totoro.actors.count)
      expect(page).to have_content("Average Age of Actors: #{average_age}")
    end
  end

  describe '#Viewing the Movie Show Page - US 3' do
    before :each do
      @baby_totoro = Actor.create!(name: "Baby Totoro", age: 140)
    end

    it 'does not list any actors not in the viewed movie' do
      visit "/movies/#{@totoro.id}"
      expect(page).to_not have_content(@noface.name)
    end

    xit 'has a form submission for a new actor that already exists in the database' do
      visit "/movies/#{@totoro.id}"
      fill_in "Add Existing Actor", with: @baby_totoro.id
      click_button "Submit"
    end

    xit 'after submission, returns to same page with new actor listed' do
      visit "/movies/#{@totoro.id}"
      fill_in "Add Existing Actor", with: @baby_totoro.id
      click_button "Submit"
      click_button "Add #{@baby_totoro.id}"
      expect(current_path).to eq("/movies/#{@totoro.id}")
      expect(page).to have_content(@baby_totoro.id)
    end
  end
end
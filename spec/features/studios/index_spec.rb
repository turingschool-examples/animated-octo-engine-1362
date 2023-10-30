require 'rails_helper'

RSpec.describe "Studio Index Page" do
  before(:each) do
    test_data
  end

  describe '#Studio Index Page - US 1' do
    it 'when visiting index, all studios including name and location are listed' do
      visit '/studios'
      expect(page).to have_content(@studioghibli.name)
      expect(page).to have_content(@studioghibli.location)
      expect(page).to have_content(@pixar.name)
      expect(page).to have_content(@pixar.location)
    end

    it 'includes each studios movies with title, creation year, and genre listed' do
      visit '/studios'
      studioghibli_movies = @studioghibli.movies
      studioghibli_movies.each do |m|
        expect(page).to have_content(m.title)
        expect(page).to have_content(m.creation_year)
        expect(page).to have_content(m.genre)
      end

      pixar_movies = @pixar.movies
      pixar_movies.each do |m|
        expect(page).to have_content(m.title)
        expect(page).to have_content(m.creation_year)
        expect(page).to have_content(m.genre)
      end
    end
  end
end
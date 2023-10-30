require 'rails_helper'

RSpec.describe 'studios index' do
  before(:each) do
    @studio_1 = Studio.create(name: "Sleepy Time Movies", location: "OKC")
    @studio_2 = Studio.create(name: "Show Biz Productions", location: "LA")
    @movie_1 = @studio_1.movies.create(title: "Blaine's Big Day", creation_year: '2023', genre: 'Tragedy')
    @movie_2 = @studio_2.movies.create(title: 'Sloppy Code', creation_year: '2023', genre: 'Horror')
  end

  describe 'I visit the studio index page' do 
    it  'I see all of the studios including name and location, and under each studio I see all of the studios movies including the movies title, creation year, and genre' do 
      visit "/studios"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)
      expect(page).to have_content(@movie_2.title)
      expect(page).to have_content(@movie_2.creation_year)
      expect(page).to have_content(@movie_2.genre)
    end
  end
end

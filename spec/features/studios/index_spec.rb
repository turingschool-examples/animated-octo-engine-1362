require "rails_helper"

RSpec.describe "studio index", type: :feature do
  before(:each) do
    @studio_1 = Studio.create!(name: "Universal", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Paramount", location: "Hollywood")

    @movie_1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "animation", studio: @studio_1)
    @movie_2 = Movie.create!(title: "Tangled", creation_year: "2000", genre: "animation", studio: @studio_1)
    @movie_3 = Movie.create!(title: "Babe", creation_year: "1997", genre: "farm", studio: @studio_2)
    @movie_4 = Movie.create!(title: "IDK", creation_year: "1975", genre: "mystery", studio: @studio_2)
  end

  describe 'When a user visits studio index page there is some information' do
    it 'They see all studios, including name and location' do
      visit "/studios"

      within "#studio-#{@studio_1.id}" do
        expect(page).to have_content(@studio_1.name)
        expect(page).to have_content(@studio_1.location)
      end

      within "#studio-#{@studio_2.id}" do
        expect(page).to have_content(@studio_2.name)
        expect(page).to have_content(@studio_2.location)
      end
    end

    it 'They see a list of each movie from each studio with its titale, creation year, and genre' do
      visit "/studios"

      within "#studio-#{@studio_1.id}" do
        expect(page).to have_content("#{@movie_1.title}, created: #{@movie_1.creation_year}, genre: #{@movie_1.genre}")
        expect(page).to have_content("#{@movie_2.title}, created: #{@movie_2.creation_year}, genre: #{@movie_2.genre}")
      end

      within "#studio-#{@studio_2.id}" do
      expect(page).to have_content("#{@movie_3.title}, created: #{@movie_3.creation_year}, genre: #{@movie_3.genre}")
      expect(page).to have_content("#{@movie_4.title}, created: #{@movie_4.creation_year}, genre: #{@movie_4.genre}")
    end
    end
  end

end
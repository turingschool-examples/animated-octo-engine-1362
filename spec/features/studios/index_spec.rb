require 'rails_helper'

RSpec.describe 'Studios index page' do
  before(:each) do

    @universal_studios = Studio.create(name: "Universal Studios", location: "Hollywood")
    @paramount = Studio.create(name: "Paramount", location: "Los Angeles")
    
    
    @M3GAN = @universal_studios.movies.create(title: "M3GAN", creation_year: "2023", genre: "horror")
    @bros = @universal_studios.movies.create(title: "Bros", creation_year: "2022", genre: "romcom")
    @hot_rod = @paramount.movies.create(title: "Hot Rod", creation_year: "2007", genre: "comedy")
    
    
    @allison_williams = Actor.create(name: "Allison Williams",  age: 35)
    @billy_eichner = Actor.create(name: "Billy Eichner",  age: 45)
    @andy_samberg = Actor.create(name: "Andy Samberg",  age: 45)
    
  end

  describe "When I visit the studio index page" do
    it 'displays studios name and location and all of their movies/movie attributes' do
      visit "/studios"
      expect(page).to have_content("Universal Studios")
      expect(page).to have_content("Hollywood")
      expect(page).to have_content("M3GAN")
      expect(page).to have_content("2023")
      expect(page).to have_content("horror")
      expect(page).to have_content("Bros")
      expect(page).to have_content("2022")
      expect(page).to have_content("romcom")
      expect(page).to have_content("Paramount")
      expect(page).to have_content("Los Angeles")
      expect(page).to have_content("Hot Rod")
      expect(page).to have_content("2007")
      expect(page).to have_content("comedy")
    end
  end
end

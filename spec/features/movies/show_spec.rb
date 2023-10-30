require 'rails_helper'

RSpec.describe 'Movies show page' do
  before(:each) do

    @universal_studios = Studio.create(name: "Universal Studios", location: "Hollywood")
    @paramount = Studio.create(name: "Paramount", location: "Los Angeles")
    
    
    @M3GAN = @universal_studios.movies.create(title: "M3GAN", creation_year: "2023", genre: "horror")
    @bros = @universal_studios.movies.create(title: "Bros", creation_year: "2022", genre: "romcom")
    @hot_rod = @paramount.movies.create(title: "Hot Rod", creation_year: "2007", genre: "comedy")
    
    
    @allison_williams = Actor.create(name: "Allison Williams",  age: 35)
    @billy_eichner = Actor.create(name: "Billy Eichner",  age: 45)
    @luke_macfarlane = Actor.create(name: "Luke Macfarlane", age: 43)
    @andy_samberg = Actor.create(name: "Andy Samberg",  age: 45)
  
    ActorMovie.create(actor_id: @billy_eichner.id, movie_id: @bros.id)
    ActorMovie.create(actor_id: @luke_macfarlane.id, movie_id: @bros.id)
    @bros.actors << [@billy_eichner, @luke_macfarlane]
  end

  describe "When I visit a movie's show page" do
    it 'displays movies attributes and all actors youngest to oldest in movie, with average age' do
      visit "/movies/#{@bros.id}"
      expect(page).to have_content("Bros")
      expect(page).to have_content("2022")
      expect(page).to have_content("romcom")
      expect(page).to have_content("Billy Eichner")
      expect(page).to have_content("45")
      expect(page).to have_content("Luke Macfarlane")
      expect(page).to have_content("43")
      
      expect(page).to have_text(/.*Luke Macfarlane.*Billy Eichner.*/)
      expect(page).to have_content("Average Age of Actors: 44")
    end
  end
end
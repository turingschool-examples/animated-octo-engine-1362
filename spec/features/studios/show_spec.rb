  # Extension
  # Studio's Actors

  # As a user,
  # When I visit a studio's show page
  # I see the studio's name and location
  # And I see a unique list of all of the actors that have worked on any of this studio's movies.

require "rails_helper"

RSpec.describe "movie show", type: :feature do
  before(:each) do
    @studio_1 = Studio.create!(name: "Universal", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Paramount", location: "Hollywood")

    @movie_1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "animation", studio: @studio_1)
    @movie_2 = Movie.create!(title: "Tangled", creation_year: "2000", genre: "animation", studio: @studio_1)
    @movie_3 = Movie.create!(title: "Babe", creation_year: "1997", genre: "farm", studio: @studio_2)
    @movie_4 = Movie.create!(title: "IDK", creation_year: "1975", genre: "mystery", studio: @studio_2)

    @actor_1 = Actor.create!(name: "Sam", age: 32)
    @actor_2 = Actor.create!(name: "Max", age: 33)
    @actor_3 = Actor.create!(name: "Ben", age: 30)
  end

  describe 'When the user visits the studio show page, there is information' do
    it 'They see studios name and location' do
      visit "studios/#{@studio_1.id}"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
    end

    it 'They see a unique list of all actors that have worked on any of this studios movies' do
      @movie_1.actors << @actor_1
      @movie_1.actors << @actor_2
      @movie_3.actors << @actor_3
      visit "studios/#{@studio_1.id}"

      expect(page).to have_content("Actors: #{@actor_1.name} #{@actor_2.name}")
      expect(page).to_not have_content(@actor_3.name)
    end
  end

end
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

  describe 'When a user visits a movies show page, there is information' do
    it 'They see the movies title, creation year and genre' do
      visit "movies/#{@movie_1.id}"

      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)
    end

    it 'They see actors in order from youngest to oldest, and average age' do
      @movie_1.actors << @actor_1
      @movie_1.actors << @actor_2
      @movie_1.actors << @actor_3

      visit "movies/#{@movie_1.id}"
      expect(page).to have_content(@movie_1.actor_age_avg)

      oldest = find("#actor-#{@actor_2.id}")
      mid = find("#actor-#{@actor_1.id}")
      youngest = find("#actor-#{@actor_3.id}")

      expect(youngest).to appear_before(mid)
      expect(mid).to appear_before(oldest)

      within "#actor-#{@actor_1.id}" do
        expect(page).to have_content(@actor_1.name)
        expect(page).to have_content(@actor_1.age)
      end

      within "#actor-#{@actor_2.id}" do
        expect(page).to have_content(@actor_2.name)
        expect(page).to have_content(@actor_2.age)
      end

      within "#actor-#{@actor_3.id}" do
        expect(page).to have_content(@actor_3.name)
        expect(page).to have_content(@actor_3.age)
      end
    end
  end

end
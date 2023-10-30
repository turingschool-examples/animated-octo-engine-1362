require 'rails_helper'

RSpec.feature 'Movie Show', type: :feature do
  

  before(:each) do
    @studio_1 = Studio.create(name: "Sleepy Time Movies", location: "OKC")
    @studio_2 = Studio.create(name: "Show Biz Productions", location: "LA")
    @movie_1 = @studio_1.movies.create(title: "Blaine's Big Day", creation_year: '2023', genre: 'Tragedy')
    @movie_2 = @studio_2.movies.create(title: 'Sloppy Code', creation_year: '2023', genre: 'Horror')
    @actor_1 = @movie_1.actors.create(name: "Blaine Kennedy", age: 30)
    @actor_2 = @movie_1.actors.create(name: "Colin Kennedy", age: 34)
    @actor_3 = Actor.create(name: "Patty Kennedy", age: 65)
  end


  describe "I visit a movie's show page." do
    it "I see the movie's title, creation year, and genre, and a list of all its actors from youngest to oldest and I see the average age of all of the movie's actors" do 
     

      visit "/movies/#{@movie_1.id}"
      

      expect(page).to have_content(@movie_1.title) 
      expect(page).to have_content(@movie_1.creation_year) 
      expect(page).to have_content(@movie_1.genre) 
      expect(page).to have_content(@actor_1.name) 
      expect(page).to have_content(@actor_1.age)
      expect(page).to have_content(@actor_2.name) 
      expect(page).to have_content(@actor_2.age) 
      expect(page).to have_content(32) 
    end
  end

  describe "I visit a movie show page" do 
    describe "I do not see any actors listed that are not part of the movie" do 
      describe " I see a form to add an actor to this movie" do 
        describe " I fill in the form with the ID of an actor that exists in the database" do
          describe "I click submit" do 
            it " I am redirected back to that movie's show page and I see the actor's name is now listed" do 
              visit "/movies/#{@movie_1.id}"
              

              expect(page).not_to have_content("Patty Kennedy")  

              fill_in "Add Actor by ID", with: "#{@actor_3.id}"
              
              click_on "Add Actor"
              
              expect(page).to have_content("#{@actor_3.name}")
            end
          end
        end
      end
    end
  end
  describe "the ID i have isn't in the database" do
    it "will return a flash message" do 
      visit "/movies/#{@movie_1.id}"
              

      expect(page).not_to have_content("Patty Kennedy")  

      fill_in "Add Actor by ID", with: "47"

      click_on "Add Actor"

      expect(page).to have_content("Actor with ID 47 not found.")
              
    end
  end
end
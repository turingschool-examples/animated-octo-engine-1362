require "rails_helper"

RSpec.describe Movie, type: :feature do
  before :each do
    @studio1 = Studio.create!(name: "Sony", location: "Hollywood")
    @studio2 = Studio.create!(name: "Disney", location: "Orlando")
    @movie1 = @studio1.movies.create!(title: "Spiderman", creation_year: "2002", genre: "superhero")
    @movie2 = @studio2.movies.create!(title: "Frozen", creation_year: "2013", genre: "animation")
    @movie3 = @studio2.movies.create!(title: "Up", creation_year: "2009", genre: "animation")
    @actor1 = @movie1.actors.create!(name: "Actor 1", age: "20")
    @actor2 = @movie1.actors.create!(name: "Actor 2", age: "10")
    @actor3 = @movie1.actors.create!(name: "Actor 3", age: "30")
    @actor4 = @movie2.actors.create!(name: "Actor 4", age: "40")
    @actor5 = @movie2.actors.create!(name: "Actor 5", age: "50")
    @actor6 = @movie3.actors.create!(name: "Actor 6", age: "60")

    @movie1.actors << @actor6
 
    
  end


  describe "As a user, when I visit a movie's show page" do
    it "I see the movie's title, creation year, and genre" do
      visit "/movies/#{@movie1.id}"
      expect(page).to have_content("Spiderman")
      expect(page).to_not have_content("Up")
      expect(page).to have_content("Year of Creation: 2002")
      expect(page).to have_content("Genre: superhero")

      visit "/movies/#{@movie2.id}"
      expect(page).to have_content("Frozen")
      expect(page).to_not have_content("Spiderman")
      expect(page).to_not have_content("Up")
      expect(page).to have_content("Year of Creation: 2013")
      expect(page).to have_content("Genre: animation")

      visit "/movies/#{@movie3.id}"
      expect(page).to have_content("Up")
      expect(page).to_not have_content("Frozen")
      expect(page).to have_content("Year of Creation: 2009")
      expect(page).to have_content("Genre: animation")

    end
    
    it "I also see a list of all its actors from youngest to oldest, and the average age of all of the movies actors" do
      visit "/movies/#{@movie1.id}"
      expect(page).to have_content("Actors, Youngest to Oldest:")
      expect("Actor 2").to appear_before("Actor 1")
      expect("Actor 1").to appear_before("Actor 3")
      expect("Actor 3").to appear_before("Actor 6")
      expect(page).to_not have_content("Actor 5")
      expect(page).to_not have_content("Actor 4")
      
      expect(page).to have_content("Average age of actors: 30")

      visit "/movies/#{@movie2.id}"
      expect(page).to have_content("Actors, Youngest to Oldest:")
      expect("Actor 4").to appear_before("Actor 5")
      expect(page).to_not have_content("Actor 1")
      expect(page).to_not have_content("Actor 2")
      expect(page).to_not have_content("Actor 3")
      expect(page).to_not have_content("Actor 6")
      
      expect(page).to have_content("Average age of actors: 45")

      visit "/movies/#{@movie3.id}"
      expect(page).to have_content("Actors, Youngest to Oldest:")
      expect(page).to_not have_content("Actor 1")
      expect(page).to_not have_content("Actor 2")
      expect(page).to_not have_content("Actor 3")
      expect(page).to_not have_content("Actor 4")
      expect(page).to_not have_content("Actor 5")
      expect(page).to have_content("Actor 6")
      
      expect(page).to have_content("Average age of actors: 60")
    end
  end
end
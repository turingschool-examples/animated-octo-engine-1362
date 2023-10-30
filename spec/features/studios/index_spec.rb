require "rails_helper"

RSpec.describe Studio, type: :feature do
  before :each do
    @studio1 = Studio.create!(name: "Sony", location: "Hollywood")
    @studio2 = Studio.create!(name: "Disney", location: "Orlando")
    @movie1 = @studio1.movies.create!(title: "Spiderman", creation_year: "2002", genre: "superhero")
    @movie2 = @studio2.movies.create!(title: "Frozen", creation_year: "2013", genre: "animation")
    @movie3 = @studio2.movies.create!(title: "Up", creation_year: "2009", genre: "animation")
  end


  describe "As a user, when I visit the studio index page" do
    it "I see all of the studios including name and location" do
      visit "/studios"
      
      within "#Sony" do
        expect(page).to have_content("Sony")
        expect(page).to have_content("Location: Hollywood")
      end
      within "#Disney" do
        expect(page).to have_content("Disney")
        expect(page).to have_content("Location: Orlando")
      end
    end
    
    it "And underneath each studio, I see all of the studios movies, including the movies title, creation year, and genre" do
      visit "/studios"
      save_and_open_page
      within "#Sony" do
        expect(page).to have_content("Movies:")
        within "#Spiderman" do
          expect(page).to have_content("Spiderman")
          expect(page).to have_content("Year of Creation: 2002")
          expect(page).to have_content("Genre: superhero")
        end
      end
      within "#Disney" do
        expect(page).to have_content("Movies:")
        within "#Frozen" do
          expect(page).to have_content("Frozen")
          expect(page).to have_content("Year of Creation: 2013")
          expect(page).to have_content("Genre: animation")
        end
        within "#Up" do
          expect(page).to have_content("Up")
          expect(page).to have_content("Year of Creation: 2009")
          expect(page).to have_content("Genre: animation")
        end
      end
    end
  end
end
require "rails_helper"

RSpec.describe "Studio Index Page" do
  describe "As a User" do
    describe "When I visit the studio index page" do
      #User Story 1
      describe "Then I see all of the studios including name and location" do
        before(:each) do
          @universal = Studio.create!(name: "Universal Studios", location: "Hollywood ,CA") 
          @warner_bros = Studio.create!(name: "Warner Bros", location: "Burbank ,CA") 

          @jurassic_park = @universal.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Action and Adventure")
          @bruce_almighty = @universal.movies.create!(title: "Bruce Almighty", creation_year: 2003, genre: "Comedy")
          @the_dark_knight = @warner_bros.movies.create!(title: "The Dark Knight", creation_year: 2008, genre: "Action and Drama")
        end
        it "Under each studio I see all the studio's movies including the movie's title, creation year, and genre" do
        
          visit "/studios"

          expect(page).to have_content("All Studios")
          expect(page).to have_content(@universal.name)
          expect(page).to have_content(@universal.location)
          expect(page).to have_content(@jurassic_park.title)
          expect(page).to have_content(@jurassic_park.creation_year)
          expect(page).to have_content(@jurassic_park.genre)
          expect(page).to have_content(@bruce_almighty.title)
          expect(page).to have_content(@bruce_almighty.creation_year)
          expect(page).to have_content(@bruce_almighty.genre)

          expect(page).to have_content(@warner_bros.name)
          expect(page).to have_content(@warner_bros.location)
          expect(page).to have_content(@the_dark_knight.title)
          expect(page).to have_content(@the_dark_knight.creation_year)
          expect(page).to have_content(@the_dark_knight.genre)
        end
      end
    end
  end
end
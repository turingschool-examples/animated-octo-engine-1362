require "rails_helper"

RSpec.describe "Movie Show Page" do
  describe "As a User" do
    describe "When I visit the Movie Show Page" do
      before(:each) do
        @universal = Studio.create!(name: "Universal Studios", location: "Hollywood ,CA") 
        @warner_bros = Studio.create!(name: "Warner Bros", location: "Burbank ,CA") 

        @jurassic_park = @universal.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Action and Adventure")
        @bruce_almighty = @universal.movies.create!(title: "Bruce Almighty", creation_year: 2003, genre: "Comedy")
        @the_dark_knight = @warner_bros.movies.create!(title: "The Dark Knight", creation_year: 2008, genre: "Action and Drama")

        @jeff_goldblum = Actor.create!(name: "Jeff Goldblum", age: 71)
        @jim_carrey = Actor.create!(name: "Jim Carrey", age: 61)
        @christian_bale = Actor.create!(name: "Christian Bale", age: 49)
        @morgan_freeman = Actor.create!(name: "Morgan Freeman", age: 86)
        @cillian_murphy = Actor.create!(name: "Cillian Murphy", age: 47)

        MovieActor.create!(movie_id: @the_dark_knight.id, actor_id: @christian_bale.id)
        MovieActor.create!(movie_id: @the_dark_knight.id, actor_id: @morgan_freeman.id)
        MovieActor.create!(movie_id: @the_dark_knight.id, actor_id: @cillian_murphy.id)
      end
      #User Story 2
      describe "Then I see the movie's title, creation year, and genre" do
        it "it lists actors from yougest to oldest and I see the average age of all the movie's actors" do
          
          visit "/movies/#{@the_dark_knight.id}"

          expect(page).to have_content(@the_dark_knight.title)
          expect(page).to have_content(@the_dark_knight.creation_year)
          expect(page).to have_content(@the_dark_knight.genre)

          expect(page).to_not have_content(@bruce_almighty.title)
          expect(page).to_not have_content(@jurassic_park.title)

          expect(page).to have_content("All Actors")

          expect(@cillian_murphy.name).to appear_before(@christian_bale.name)
          expect(@christian_bale.name).to appear_before(@morgan_freeman.name)

          expect(page).to have_content("Average Age: 61")
        end
      end
    end 
  end 
end 
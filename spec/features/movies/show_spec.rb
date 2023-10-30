require "rails_helper"

RSpec.describe "Movie Show" do
  before :each do
    @studio_1 = Studio.create!(name: "MAPPA Studio", location: "Suginami")

    @movie_1 = @studio_1.movies.create!(title: "Jujutsu Kaisen", creation_year: "2018", genre: "Adventure Dark", studio_id: @studio_1.id)

    @actor_1 = Actor.create!(name: "Yuji Itadori", age: 15)
    @actor_2 = Actor.create!(name: "Gojo Satoru", age: 29)
    @actor_3 = Actor.create!(name: "Megumi Fushiguro", age: 15)
    @actor_4 = Actor.create!(name: "Maki Zenin", age: 16)
  end

  describe "US 2- Movie Show Page" do
    describe "When i visit a movie page I see the movies info" do
      it "Also displays all actors in it from youngest to oldest and I see the average age of all the actors" do
        @movie_1.actors << [@actor_1, @actor_2, @actor_3, @actor_4]
        visit "/movies/#{@movie_1.id}"

        expect(page).to have_content(@movie_1.title)
        expect(page).to have_content(@movie_1.creation_year)
        expect(page).to have_content(@movie_1.genre)

        expect(page).to have_content(@actor_1.name)
        expect(page).to have_content(@actor_3.name)
        expect(page).to have_content(@actor_4.name)
        expect(page).to have_content(@actor_2.name)
        expect(page).to have_content("Actors Average Age: 18.75")
      end
    end
  end

  describe "US 3 - Add and Actor to a Movie" do
    describe "Dont see any actors listed that arent apart of the movie and I see a form to add an actor to this movie" do
      describe "fill in the form and click submit" do
        it "See the actors name is not listed" do
          @movie_1.actors << [@actor_1, @actor_2]
          visit "/movies/#{@movie_1.id}"

          save_and_open_page

          expect(page).to have_content(@actor_1.name)
          expect(page).to have_content(@actor_2.name)

          expect(page).to have_no_content(@actor_3.name)

          expect(page).to have_content("Add an actor to this movie")

          fill_in "Actors ID", with: "#{@actor_3.id}"
          click_button "Submit"

          expect(current_path).to eq("/movies/#{@movie_1.id}")
          expect(page).to have_content(@actor_3.name)
        end
      end
    end
  end
end

require 'rails_helper' 

RSpec.describe "Movies Show Page" do 
  before(:each) do 
    @paramount = Studio.create!({ name: "Paramount Pictures", location: "Hollywood, California."})
    @universal = Studio.create!({ name: "Universal Studios", location: "Hollywood, California."})
    @tg_maveric = @paramount.movies.create!({ title: "Top Gun: Maverick", creation_year: "2022", genre: "Action/Drama"})
    @titanic = @paramount.movies.create!({ title: "Titanic", creation_year: "1997", genre: "Disaster"})
    @jurassic_world = @universal.movies.create!({ title: "Jurassic World", creation_year: "2015", genre: "Sci-fi/Action"})
    @mario = @universal.movies.create!({ title: "The Super Mario Bros. Movie", creation_year: "2023", genre: "Adventure/Comedy"})
    @tom = Actor.create!({ name: "Tom Cruise", age: 61})
    @jennifer = Actor.create!({ name: "Jennifer Connelly", age: 52})
    @miles = Actor.create!({ name: "Miles Teller", age: 36})
    @kate = Actor.create!({ name: "Kate Winslet", age: 48})
    ActorMovie.create!({ movie_id: @tg_maveric.id, actor_id: @tom.id})
    ActorMovie.create!({ movie_id: @tg_maveric.id, actor_id: @jennifer.id})
  end

  context "visiting movies/:id" do 
    describe "Movie Show Page" do 
      it "displays all of a movies info, and a list of all its actors, youngest to oldest, and the average age of all the movies actors." do 
        visit "/movies/#{@tg_maveric.id}"

        expect(page).to have_content(@tg_maveric.title)
        expect(page).to have_content("Creation Year: #{@tg_maveric.creation_year}")
        expect(page).to have_content("Genre: #{@tg_maveric.genre}")
        expect(page).to have_content("Cast:")
        expect(page).to have_content(@tom.name)
        expect(page).to have_content("Age: #{@tom.age}")
        expect(page).to have_content(@jennifer.name)
        expect(page).to have_content("Age: #{@jennifer.age}")
        expect(page).to have_content("Average Cast Age: 56")
      end
      it "doesn't show actors that are not part of the movie" do 
        visit "/movies/#{@tg_maveric.id}"

        expect(page).to_not have_content(@miles.name)
        expect(page).to_not have_content(@kate.name)
      end
    end
    describe "Adding an Actor to a Movie" do 
      it "has a form to add an Actor to this movie, using the Actors ID" do 
        visit "/movies/#{@tg_maveric.id}"

        within "#add_actor" do
        expect(page).to have_field(:actor_id)
        end
      end

      it "redirects me back to the movie/show page after clicking submit, and the actors name is now listed." do
        visit "/movies/#{@tg_maveric.id}"
        within "#add_actor" do
        fill_in :actor_id, with: @miles.id
        click_button "Submit"
        end

        expect(current_path).to eq("/movies/#{@tg_maveric.id}")
        expect(page).to have_content(@miles.name)
      end
    end
  end
end 
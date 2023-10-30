require 'rails_helper' 

RSpec.describe "Studio Index Page" do 
  before(:each) do 
    @paramount = Studio.create!({ name: "Paramount Pictures", location: "Hollywood, California."})
    @universal = Studio.create!({ name: "Universal Studios", location: "Hollywood, California."})
    @tg_maveric = @paramount.movies.create!({ title: "Top Gun: Maverick", creation_year: "2022", genre: "Action/Drama"})
    @titanic = @paramount.movies.create!({ title: "Titanic", creation_year: "1997", genre: "Disaster"})
    @jurassic_world = @universal.movies.create!({ title: "Jurassic World", creation_year: "2015", genre: "Sci-fi/Action"})
    @mario = @universal.movies.create!({ title: "The Super Mario Bros. Movie", creation_year: "2023", genre: "Adventure/Comedy"})
  end
 
  context "Visiting /studios" do 
    describe "Studio Index" do 
      it "displays all the studios including name/location" do 
        visit "/studios"

        expect(page).to have_content("Studios Index")
        expect(page).to have_content("Paramount Pictures")
        expect(page).to have_content("Location: #{@paramount.location}")
        expect(page).to have_content("Film Library")
        expect(page).to have_content(@tg_maveric.title)
        expect(page).to have_content("Creation Year: #{@tg_maveric.creation_year}")
        expect(page).to have_content("Genre: #{@tg_maveric.genre}")
        expect(page).to have_content(@titanic.title)
        expect(page).to have_content("Creation Year: #{@titanic.creation_year}")
        expect(page).to have_content("Genre: #{@titanic.genre}")
        expect(page).to have_content("Universal Studios")
        expect(page).to have_content("Location: #{@universal.location}")
        expect(page).to have_content("Film Library")
        expect(page).to have_content(@jurassic_world.title)
        expect(page).to have_content("Creation Year: #{@jurassic_world.creation_year}")
        expect(page).to have_content("Genre: #{@jurassic_world.genre}")
        expect(page).to have_content(@mario.title)
        expect(page).to have_content("Creation Year: #{@mario.creation_year}")
        expect(page).to have_content("Genre: #{@mario.genre}")
      end
    end
  end
end 
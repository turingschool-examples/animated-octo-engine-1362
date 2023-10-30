require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many(:actor_movies)}
    it {should have_many(:actors).through(:actor_movies)}
  end

  before(:each) do 
    @paramount = Studio.create!({ name: "Paramount Pictures", location: "Hollywood, California."})
    @universal = Studio.create!({ name: "Universal Studios", location: "Hollywood, California."})
    @tg_maveric = @paramount.movies.create!({ title: "Top Gun: Maverick", creation_year: "2022", genre: "Action/Drama"})
    @titanic = @paramount.movies.create!({ title: "Titanic", creation_year: "1997", genre: "Disaster"})
    @jurassic_world = @universal.movies.create!({ title: "Jurassic World", creation_year: "2015", genre: "Sci-fi/Action"})
    @mario = @universal.movies.create!({ title: "The Super Mario Bros. Movie", creation_year: "2023", genre: "Adventure/Comedy"})
    @tom = Actor.create!({ name: "Tom Cruise", age: 61})
    @jennifer = Actor.create!({ name: "Jennifer Connelly", age: 52})
    ActorMovie.create!({ movie_id: @tg_maveric.id, actor_id: @tom.id})
    ActorMovie.create!({ movie_id: @tg_maveric.id, actor_id: @jennifer.id}) 
   end

  describe ".average_actor_age" do 
    it "returns the average age of all Actors in a Movie" do 
      expect(@tg_maveric.average_actor_age).to eq(56)
    end
  end
end

require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe "class methods" do
    before(:each) do
      @universal = Studio.create!(name: "Universal Studios", location: "Hollywood")
      @sony = Studio.create!(name: "Sony Pictures", location: "Culver City")
      @bourne = @universal.movies.create!(title: "Jason Bourne", creation_year: "2002", genre: "action")
      @spiderman = @sony.movies.create!(title: "Spider-Man", creation_year: 2023, genre: "action")
      @smoore = Actor.create!(name: "Shameik Moore", age: 28)
      @hsteinfeld = Actor.create!(name: "Hailee Steinfeld", age: 26)
      @mdamon = Actor.create!(name: "Matt Damon", age: 53)
      MovieActor.create!(movie_id: @spiderman.id, actor_id: @smoore.id)
      MovieActor.create!(movie_id: @spiderman.id, actor_id: @hsteinfeld.id)
      MovieActor.create!(movie_id: @bourne.id, actor_id: @mdamon.id)
    end

    describe "#youngest_to_oldest" do
      it "orders the actors youngest to oldest" do
        expect(Actor.youngest_to_oldest).to eq [@hsteinfeld, @smoore, @mdamon]
      end
    end
    
    describe "#average_age" do
      it "averages the ages" do
        expect(Actor.average_age.to_i).to eq 107/3
        expect(@spiderman.actors.average_age.to_i).to eq 27
      end
    end
  end
end
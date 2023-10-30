require "rails_helper"

RSpec.describe Studio, type: :model do
  describe "relationships" do
    it {should have_many :movies}
    it {should have_many(:movie_actors).through(:movies)}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe "instance methods" do
    before(:each) do
      @universal = Studio.create!(name: "Universal Studios", location: "Hollywood")
      @sony = Studio.create!(name: "Sony Pictures", location: "Culver City")
      @bourne = @universal.movies.create!(title: "Jason Bourne", creation_year: "2002", genre: "action")
      @spiderman2 = @sony.movies.create!(title: "Spider-Man: Across the Spider-Verse", creation_year: 2023, genre: "action")
      @spiderman1 = @sony.movies.create!(title: "Spider-Man: Into the Spider-Verse", creation_year: 2018, genre: "action")
      @smoore = Actor.create!(name: "Shameik Moore", age: 28)
      @hsteinfeld = Actor.create!(name: "Hailee Steinfeld", age: 26)
      @mdamon = Actor.create!(name: "Matt Damon", age: 53)
      @jjohnson = Actor.create!(name: "Jake Johnson", age: 45)
      MovieActor.create!(movie_id: @spiderman2.id, actor_id: @smoore.id)
      MovieActor.create!(movie_id: @spiderman2.id, actor_id: @hsteinfeld.id)
      MovieActor.create!(movie_id: @spiderman2.id, actor_id: @jjohnson.id)
      MovieActor.create!(movie_id: @bourne.id, actor_id: @mdamon.id)
      MovieActor.create!(movie_id: @spiderman1.id, actor_id: @smoore.id)
      MovieActor.create!(movie_id: @spiderman1.id, actor_id: @hsteinfeld.id)
      MovieActor.create!(movie_id: @spiderman1.id, actor_id: @jjohnson.id)
    end

    describe "#unique_actors" do
      it "shows the distinct actors that have worked for the studio" do
        expect(@sony.unique_actors).to eq [@smoore, @hsteinfeld, @jjohnson]
      end
    end
  end
end

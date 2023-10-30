require "rails_helper"

RSpec.describe Movie, type: :model do
  before(:each) do
    @ghibli = Studio.create!(name: "Studio Ghibli", location: "Tokyo")
    @mononoke = @ghibli.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Action")
    @mononoke_actor = @mononoke.actors.create!(name: "John DiMaggio", age: 45)
    @mononoke_actress = @mononoke.actors.create!(name: "Claire Danes", age: 37)
    @new_actor = Actor.create!(name: "Joseph Lee", age: 26)
    @new_actress = Actor.create!(name: "Taylor Swift", age: 28)
  end
  describe "relationships" do
    it { should belong_to :studio }
    it { should have_many :movie_actors }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:creation_year) }
    it { should validate_presence_of(:genre) }
    it { should validate_numericality_of(:creation_year) }
  end

  describe "#order_actors" do
    it "orders the actors of a movie from youngest to oldest" do
      expect(@mononoke.order_actors).to eq([@mononoke_actress, @mononoke_actor])
    end
  end

  describe "#average_age" do
    it "calculates the average age of the cast on the movie as a float rounded to one decimal" do
      expect(@mononoke.actors).to eq([@mononoke_actor, @mononoke_actress])
      expect(@mononoke_actor.age).to eq(45)
      expect(@mononoke_actress.age).to eq(37)
      expect(@mononoke.average_age).to eq(41.0)
    end
  end

  describe "#add_actor" do
    it "adds an actor to the movie" do
      expect(@mononoke.actors).to eq([@mononoke_actor, @mononoke_actress])
      expect(@mononoke_actor.age).to eq(45)
      expect(@mononoke_actress.age).to eq(37)
      expect(@mononoke.average_age).to eq(41.0)

      @mononoke.add_actor(@new_actor)
      expect(@mononoke.actors).to eq([@mononoke_actor, @mononoke_actress, @new_actor])
      expect(@mononoke.average_age).to eq(36.0)

      @mononoke.add_actor(@new_actress)
      expect(@mononoke.actors).to eq([@mononoke_actor, @mononoke_actress, @new_actor, @new_actress])
      expect(@mononoke.average_age).to eq(34.0)
    end
  end
end

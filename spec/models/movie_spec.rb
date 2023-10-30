require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  before (:each) do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Ramoji Film City", location: "India")
    @movie_1 = @studio_1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
    @movie_2 = @studio_1.movies.create!(title: "Mystery Men", creation_year: "1999", genre: "action")
    @movie_3 = @studio_2.movies.create!(title: "RRR", creation_year: "2022", genre: "action")
    @movie_4 = @studio_2.movies.create!(title: "Aadhi", creation_year: "2018", genre: "thriller")
    @actor_1 = @movie_1.actors.create!(name: "Tim Allen", age: 70)
    @actor_2 = @movie_1.actors.create!(name: "Tom Hanks", age: 67)
    @actor_3 = @movie_2.actors.create!(name: "Ben Stiller", age: 57)
  end

  describe "instance methods" do
    describe "#list_actors" do
      it "returns the names of a movie's actors as a string" do
        expect(@movie_1.list_actors).to eq("Tom Hanks and Tim Allen")
      end
    end

    describe "#ave_actor_age" do
      it "returns the average age of actors for a movie as a string" do
        expect(@movie_1.ave_actor_age).to eq("68.5")
      end
    end
  end
end

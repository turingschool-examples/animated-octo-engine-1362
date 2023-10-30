require "rails_helper"

RSpec.describe Studio, type: :model do
  describe "relationships" do
    it {should have_many :movies}
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
    describe "#list_movies_details" do
      it "returns a list of a studios's employees and their details" do
        expect(@studio_1.list_movies_details).to eq(["Toy Story, 1995, animation", "Mystery Men, 1999, action"])
      end
    end

    describe "#list_actors" do
      it "returns a list of a all actors' names from the studios' movies" do
        expect(@studio_1.list_actors).to eq("Ben Stiller, Tim Allen, and Tom Hanks")
      end
    end
  end
end

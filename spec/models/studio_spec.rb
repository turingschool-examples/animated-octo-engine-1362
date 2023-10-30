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
  end

  describe "instance methods" do
    describe "#list_movies_details" do
      it "returns a list of a studios's employees and their details" do
        expect(@studio_1.list_movies_details).to eq(["Toy Story, 1995, animation", "Mystery Men, 1999, action"])
      end
    end
  end
end

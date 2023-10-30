require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:creation_year) }
    it { should validate_presence_of(:genre) }
  end

  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :actor_movies}
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe "movie#methods" do
    it "can give average age of all actors" do
      a24 = Studio.create!(name: "A24", location: "New York")
      swiss = Movie.create!(title: "Swiss Army Man", creation_year: "2016", genre: "drama", studio_id: a24.id)
      swiss.actors.create!([{name: "Paul Dano", age: 32}, {name: "Daniel Radcliffe", age: 34}, {name: "Mary Elizabeth Winstead", age: 25}])

      expect(swiss.average_age).to eq(30.33)
    end

  end

  describe "movie.methods" do
    it "can list all actors from youngest to oldest" do
      a24 = Studio.create!(name: "A24", location: "New York")
      swiss = Movie.create!(title: "Swiss Army Man", creation_year: "2016", genre: "drama", studio_id: a24.id)
      paul = swiss.actors.create!(name: "Paul Dano", age: 32)
      dan = swiss.actors.create!(name: "Daniel Radcliffe", age: 34)
      mary = swiss.actors.create!(name: "Mary Elizabeth Winstead", age: 24)

      expect(swiss.youngest_to_oldest).to eq([mary, paul, dan])
    end
  end
end

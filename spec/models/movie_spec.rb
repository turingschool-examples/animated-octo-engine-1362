require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:creation_year) }
    it { should validate_numericality_of(:creation_year) }
    it { should validate_presence_of(:genre) }
  end

  before :each do
    @studio1 = Studio.create!(name: "Sony", location: "Hollywood")
    @studio2 = Studio.create!(name: "Disney", location: "Orlando")
    @movie1 = @studio1.movies.create!(title: "Spiderman", creation_year: "2002", genre: "superhero")
    @movie2 = @studio2.movies.create!(title: "Frozen", creation_year: "2013", genre: "animation")
    @movie3 = @studio2.movies.create!(title: "Up", creation_year: "2009", genre: "animation")
    @actor1 = @movie1.actors.create!(name: "Actor 1", age: "20")
    @actor2 = @movie1.actors.create!(name: "Actor 2", age: "10")
    @actor3 = @movie1.actors.create!(name: "Actor 3", age: "30")
    @actor4 = @movie2.actors.create!(name: "Actor 4", age: "40")
    @actor5 = @movie2.actors.create!(name: "Actor 5", age: "50")
    @actor6 = @movie3.actors.create!(name: "Actor 6", age: "60")

    @movie1.actors << @actor6
 
    
  end
  describe "#actors_youngest_to_oldest" do
    it "gives the nanes of actors in a movie in order from youngest to oldest" do
      expect(@movie1.actors_youngest_to_oldest).to eq(["Actor 2", "Actor 1", "Actor 3", "Actor 6"])
      expect(@movie2.actors_youngest_to_oldest).to eq(["Actor 4", "Actor 5"])
      expect(@movie3.actors_youngest_to_oldest).to eq(["Actor 6"])
    end
  end

  describe "#average_age_of_actors" do
    it "gives the average age of actors in a movie" do
      expect(@movie1.average_age_of_actors).to eq(30)
      expect(@movie2.average_age_of_actors).to eq(45)
      expect(@movie3.average_age_of_actors).to eq(60)
    end
  end
end

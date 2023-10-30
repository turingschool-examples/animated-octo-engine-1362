require "rails_helper"

RSpec.describe Studio, type: :model do
  describe "relationships" do
    it {should have_many :movies}
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
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
  describe "#actors" do
    it "gives the nanes of actors in any movie produced by the studio" do
      expect(@studio1.actors).to eq(["Actor 1", "Actor 2", "Actor 3", "Actor 6"])
      expect(@studio2.actors).to eq(["Actor 4", "Actor 5", "Actor 6"])
    end
  end
end

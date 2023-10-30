require "rails_helper"

RSpec.describe Studio, type: :model do
  describe "relationships" do
    it { should have_many :movies }
    it { should have_many(:actors), through:(:movies) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
  end

  before(:each) do
    @studio_1 = Studio.create!(name: "Universal", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Paramount", location: "Hollywood")

    @movie_1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "animation", studio: @studio_1)
    @movie_2 = Movie.create!(title: "Tangled", creation_year: "2000", genre: "animation", studio: @studio_1)
    @movie_3 = Movie.create!(title: "Babe", creation_year: "1997", genre: "farm", studio: @studio_2)
    @movie_4 = Movie.create!(title: "IDK", creation_year: "1975", genre: "mystery", studio: @studio_2)

    @actor_1 = Actor.create!(name: "Sam", age: 32)
    @actor_2 = Actor.create!(name: "Max", age: 33)
    @actor_3 = Actor.create!(name: "Ben", age: 30)
  end

  describe 'instance methods' do
    describe '#actors_all' do
      it 'returns unique list of actors that have worked with this studio' do
        @studio_1 = Studio.create!(name: "Universal", location: "Hollywood")
        @studio_2 = Studio.create!(name: "Paramount", location: "Hollywood")
    
        @movie_1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "animation", studio: @studio_1)
        @movie_2 = Movie.create!(title: "Tangled", creation_year: "2000", genre: "animation", studio: @studio_1)
        @movie_3 = Movie.create!(title: "Babe", creation_year: "1997", genre: "farm", studio: @studio_2)
        @movie_4 = Movie.create!(title: "IDK", creation_year: "1975", genre: "mystery", studio: @studio_2)
    
        @actor_1 = Actor.create!(name: "Sam", age: 32)
        @actor_2 = Actor.create!(name: "Max", age: 33)
        @actor_3 = Actor.create!(name: "Ben", age: 30)
        
        @movie_1.actors << @actor_1
        @movie_1.actors << @actor_2
        @movie_2.actors << @actor_1
        @movie_2.actors << @actor_2
        @movie_3.actors << @actor_3

        expect(@studio_1.actors_all).to eq([@actor_1, @actor_2])
        expect(@studio_2.actors_all).to eq([@actor_3])
      end
    end
  end
end

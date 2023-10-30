require "rails_helper"

RSpec.describe Movie, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :creation_year }
    it { should validate_presence_of :genre }
  end
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many :actors}
  end

  before(:each) do
    @studio_1 = Studio.create!(name: "Paramount", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Fox Searchlight Pictures", location: "Los Angeles")
    @studio_3 = Studio.create!(name: "Mosfilm", location: "Moscow")

    @movie_1 = @studio_1.movies.create!(title: "Killers of the Flower Moon", creation_year: 2023, genre: "crime noir")
    @movie_2 = @studio_1.movies.create!(title: "The Truman Show", creation_year: 1998, genre: "drama")
    @movie_3 = @studio_2.movies.create!(title: "The Tree of Life", creation_year: 2011, genre: "drama")
    @movie_4 = @studio_2.movies.create!(title: "A Hidden Life", creation_year: 2019, genre: "drama")
    @movie_5 = @studio_3.movies.create!(title: "Stalker", creation_year: 1979, genre: "science fiction")

    @actor_1 = Actor.create!(name: "Robert DeNiro", age: 80)
    @actor_2 = Actor.create!(name: "Leonardo DiCaprio", age: 48)
    @actor_3 = Actor.create!(name: "Lily Gladstone", age: 37)
    

    @movie_actor_1 = MovieActor.create!(movie: @movie_1, actor: @actor_1)
    @movie_actor_2 = MovieActor.create!(movie: @movie_1, actor: @actor_2)
    @movie_actor_3 = MovieActor.create!(movie: @movie_1, actor: @actor_3)
  end

  describe "#instance methods" do
    describe "actor_sort" do
      it "sorts all the actors associated with a movie by age from youngest to oldest" do
        expect(@movie_1.actor_sort).to eq([@actor_3, @actor_2, @actor_1])
      end
    end

    describe "actor_age_avg" do
      it "finds the average age of all actors in a movie" do
        expect(@movie_1.actor_age_avg).to eq(55)
      end
    end
  end
end

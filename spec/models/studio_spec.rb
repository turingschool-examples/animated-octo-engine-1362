require "rails_helper"

RSpec.describe Studio, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end

  describe "relationships" do
    it {should have_many :movies}
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
    @movie_6 = @studio_1.movies.create!(title: "The Untouchables", creation_year: 1987, genre: "crime noir")

    @actor_1 = Actor.create!(name: "Robert DeNiro", age: 80)
    @actor_2 = Actor.create!(name: "Leonardo DiCaprio", age: 48)
    @actor_3 = Actor.create!(name: "Lily Gladstone", age: 37)
    

    @movie_actor_1 = MovieActor.create!(movie: @movie_1, actor: @actor_1)
    @movie_actor_2 = MovieActor.create!(movie: @movie_1, actor: @actor_2)
    @movie_actor_3 = MovieActor.create!(movie: @movie_1, actor: @actor_3)
    @movie_actor_4 = MovieActor.create!(movie: @movie_6, actor: @actor_1)
  end

  describe "#instance _methods" do
    describe "studio_actors" do
      it "shows all the actors that are in movies that this studio has made
      and doesn't show repeat actors" do
        expect(@studio_1.studio_actors).to eq([@actor_1, @actor_2, @actor_3])
      end
    end
  end
end

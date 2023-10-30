require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  before(:each) do
    @universal = Studio.create!(name: "Universal Studios", location: "Hollywood ,CA") 
    @warner_bros = Studio.create!(name: "Warner Bros", location: "Burbank ,CA") 

    @jurassic_park = @universal.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Action and Adventure")
    @bruce_almighty = @universal.movies.create!(title: "Bruce Almighty", creation_year: 2003, genre: "Comedy")
    @the_dark_knight = @warner_bros.movies.create!(title: "The Dark Knight", creation_year: 2008, genre: "Action and Drama")

    @jeff_goldblum = Actor.create!(name: "Jeff Goldblum", age: 71)
    @jim_carrey = Actor.create!(name: "Jim Carrey", age: 61)
    @christian_bale = Actor.create!(name: "Christian Bale", age: 49)
    @morgan_freeman = Actor.create!(name: "Morgan Freeman", age: 86)
    @cillian_murphy = Actor.create!(name: "Cillian Murphy", age: 47)

    MovieActor.create!(movie_id: @the_dark_knight.id, actor_id: @christian_bale.id)
    MovieActor.create!(movie_id: @the_dark_knight.id, actor_id: @morgan_freeman.id)
    MovieActor.create!(movie_id: @the_dark_knight.id, actor_id: @cillian_murphy.id)
  end

  describe "#sort_actors_by_age" do
    it "can sort actors by age youngest to oldest" do
      query = @the_dark_knight.sort_actors_by_age

      expect(query).to eq([@cillian_murphy, @christian_bale, @morgan_freeman])
    end
  end
end

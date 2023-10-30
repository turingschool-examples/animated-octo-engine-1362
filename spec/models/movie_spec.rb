require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
  end

  describe "instance methods" do
    it "sorts a movie's actors by age" do 
      paramount = Studio.create!({name: "Paramount Pictures", location: "Hollywood"})
      jaws = paramount.movies.create({title: "Jaws", creation_year: "1976", genre: "Action"})
      
      roy = Actor.create!({name: "Roy Scheider", age: 36})
      richard = Actor.create!({name: "Richard Dreyfuss", age: 28})
      robert = Actor.create!({name: "Robert Shaw", age: 61})
  
      jaws_actor_1 = MovieActor.create!({actor_id: roy.id, movie_id: jaws.id})
      jaws_actor_2 = MovieActor.create!({actor_id: richard.id, movie_id: jaws.id})
      jaws_actor_3 = MovieActor.create!({actor_id: robert.id, movie_id: jaws.id})

      expect(jaws.actor_sort).to eq([richard, roy, robert])
    end
    it "calculates the average age of all the actors in the movie" do 
      paramount = Studio.create!({name: "Paramount Pictures", location: "Hollywood"})
      jaws = paramount.movies.create({title: "Jaws", creation_year: "1976", genre: "Action"})
      
      roy = Actor.create!({name: "Roy Scheider", age: 36})
      richard = Actor.create!({name: "Richard Dreyfuss", age: 28})
      robert = Actor.create!({name: "Robert Shaw", age: 61})
  
      jaws_actor_1 = MovieActor.create!({actor_id: roy.id, movie_id: jaws.id})
      jaws_actor_2 = MovieActor.create!({actor_id: richard.id, movie_id: jaws.id})
      jaws_actor_3 = MovieActor.create!({actor_id: robert.id, movie_id: jaws.id})

      expect(jaws.avg_age).to eq(41.7)
    end
  end
end

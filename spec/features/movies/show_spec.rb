require "rails_helper"

RSpec.describe "Movie Show Page" do 
  it "shows the movie's title, creation year, and genre" do

    paramount = Studio.create!({name: "Paramount Pictures", location: "Hollywood"})
    jaws = paramount.movies.create({title: "Jaws", creation_year: "1976", genre: "Action"})

    visit "/movies/#{jaws.id}"

    expect(page).to have_content("Title: Jaws")
    expect(page).to have_content("Year: 1976")
    expect(page).to have_content("Genre: Action")
  end

  it "shows each movie's actors sorted from youngest to oldest" do 

    paramount = Studio.create!({name: "Paramount Pictures", location: "Hollywood"})
    jaws = paramount.movies.create({title: "Jaws", creation_year: "1976", genre: "Action"})
    
    roy = Actor.create!({name: "Roy Scheider", age: 36})
    richard = Actor.create!({name: "Richard Dreyfuss", age: 28})
    robert = Actor.create!({name: "Robert Shaw", age: 61})

    jaws_actor_1 = MovieActor.create!({actor_id: roy.id, movie_id: jaws.id})
    jaws_actor_2 = MovieActor.create!({actor_id: richard.id, movie_id: jaws.id})
    jaws_actor_3 = MovieActor.create!({actor_id: robert.id, movie_id: jaws.id})

    visit "/movies/#{jaws.id}"

    expect(page).to have_content("Cast:")
    expect(page).to have_content("Richard Dreyfuss, age: 28")
    expect(page).to have_content("Roy Scheider, age: 36")
    expect(page).to have_content("Robert Shaw, age: 61")

    expect(page).to have_content("Average Age of Actors: 41.7")
  end

  it "shows only the actors that are in that particular movie" do 

    paramount = Studio.create!({name: "Paramount Pictures", location: "Hollywood"})
    jaws = paramount.movies.create({title: "Jaws", creation_year: "1976", genre: "Action"})

    mgm = Studio.create!({name: "MGM", location: "Burbank"})
    kane = mgm.movies.create({title: "Citizen Kane", creation_year: "1942", genre: "Drama"})

    roy = Actor.create!({name: "Roy Scheider", age: 36})
    richard = Actor.create!({name: "Richard Dreyfuss", age: 28})
    robert = Actor.create!({name: "Robert Shaw", age: 61})

    orson = Actor.create!({name: "Orson Welles", age: 34})

    jaws_actor_1 = MovieActor.create!({actor_id: roy.id, movie_id: jaws.id})
    ck_actor_1 = MovieActor.create!({actor_id: orson.id, movie_id: kane.id})

    visit "/movies/#{jaws.id}"

    expect(page).to_not have_content("Title: Citizen Kane")
    expect(page).to_not have_content("Orson Welles, age: 34")
  end

    it "sorts actors by age" do 
      paramount = Studio.create!({name: "Paramount Pictures", location: "Hollywood"})
      jaws = paramount.movies.create({title: "Jaws", creation_year: "1976", genre: "Action"})
      
      roy = Actor.create!({name: "Roy Scheider", age: 36})
      richard = Actor.create!({name: "Richard Dreyfuss", age: 28})
      robert = Actor.create!({name: "Robert Shaw", age: 61})

      jaws_actor_1 = MovieActor.create!({actor_id: roy.id, movie_id: jaws.id})
      jaws_actor_2 = MovieActor.create!({actor_id: richard.id, movie_id: jaws.id})
      jaws_actor_3 = MovieActor.create!({actor_id: robert.id, movie_id: jaws.id})

      visit "/movies/#{jaws.id}"

      expect("Richard Dreyfuss").to appear_before("Roy Scheider")
      expect("Roy Scheider").to appear_before("Robert Shaw")

    end

    it "has a form to add an actor to a movie" do

      paramount = Studio.create!({name: "Paramount Pictures", location: "Hollywood"})
      jaws = paramount.movies.create({title: "Jaws", creation_year: "1976", genre: "Action"})
      
      roy = Actor.create!({name: "Roy Scheider", age: 36})
      richard = Actor.create!({name: "Richard Dreyfuss", age: 28})
      robert = Actor.create!({name: "Robert Shaw", age: 61})
      lorraine = Actor.create!({name: "Lorraine Gary", age: 38})

      jaws_actor_1 = MovieActor.create!({actor_id: roy.id, movie_id: jaws.id})
      jaws_actor_2 = MovieActor.create!({actor_id: richard.id, movie_id: jaws.id})
      jaws_actor_3 = MovieActor.create!({actor_id: robert.id, movie_id: jaws.id})

      visit "/movies/#{jaws.id}"

      expect(page).to have_content("Add Actor")
      expect(page).to have_field(:actor_id)
      expect(page).to have_button("Add Actor")

      fill_in(:actor_id, with: lorraine.id)

      click_button("Add Actor")

      expect(current_path).to eq("/movies/#{jaws.id}")
      expect(page).to have_content("Lorraine Gary, age: 38")
    end

end 
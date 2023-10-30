require "rails_helper"

RSpec.describe "Movie" do
  before(:each) do
    @studio1 = Studio.create(name: "Lucasfilm", location: "Burbank, CA")
    @studio2 = Studio.create(name: "Conaco", location: "Hollywood, CA")
    @movie1 = @studio1.movies.create(title: "Star Wars", creation_year: "1977", genre: "Sci-fi")
    @movie2 = @studio1.movies.create(title: "Indiana Jones", creation_year: "1981", genre: "Adventure")
    @movie3 = @studio2.movies.create(title: "Hans and Frans Big Adventure", creation_year: "1993", genre: "Comedy")
    @movie4 = @studio2.movies.create(title: "The Year 2000", creation_year: "2003", genre: "Comedy")
    @actor1 = Actor.create(name: "Mark Hammil", age: 27)
    @actor2 = Actor.create(name: "Arnold Swarzenneger", age: 25)
    @actor3 = Actor.create(name: "Meryl Streep", age: 27)

    ActorMovie.create(actor: @actor1, movie: @movie3)
    ActorMovie.create(actor: @actor2, movie: @movie3)
  end

  it "has a show page" do
    # Story 2 - Movie Show

    # As a user,
    # When I visit a movie's show page.
    visit "/movies/#{@movie3.id}"
    save_and_open_page
    # I see the movie's title, creation year, and genre,
    expect(page).to have_content("Title: #{@movie3.title}")
    expect(page).to have_content("Released in: #{@movie3.creation_year}")
    expect(page).to have_content("Genre: #{@movie3.genre}")
    save_and_open_page
    # and a list of all its actors from youngest to oldest.
    expect(page).to have_content("Actors in this movie: #{@actor2.name}, #{@actor1.name}")
    expect(page).to_not have_content("Meryl Streep")
  
    # And I see the average age of all of the movie's actors
    expect(page).to have_content("Average age of cast members: 26")
  end

  it "can add actors to movies" do
    # Story 3
    # Add an Actor to a Movie

    # As a user,
    # When I visit a movie show page,
    visit "/movies/#{@movie3.id}"
    # I do not see any actors listed that are not part of the movie
    expect(page).to_not have_content("Meryl Streep")
    # And I see a form to add an actor to this movie
    # When I fill in the form with the ID of an actor that exists in the database
    fill_in("actor_id", with: @actor3.id)
    # And I click submit
    click_button("Submit")
    # Then I am redirected back to that movie's show page
    expect(current_path).to eq("/movies/#{@movie3.id}")
    # And I see the actor's name is now listed
    visit "/movies/#{@movie3.id}"
    expect(page).to have_content("#{@actor3.name}")
    # (You do not have to test for a sad path, for example if the id submitted is not an existing actor)
  end
end

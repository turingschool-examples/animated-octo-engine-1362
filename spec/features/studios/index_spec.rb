require "rails_helper"

RSpec.describe "Studio Index Page" do 

  it "lists all the studios, including name and location" do 

    paramount = Studio.create!({name: "Paramount Pictures", location: "Hollywood"})
    mgm = Studio.create!({name: "MGM", location: "Burbank"})
    universal = Studio.create!({name: "Universal Studios", location: "Hollywood"})

    jaws = paramount.movies.create({title: "Jaws", creation_year: "1976", genre: "Action"})
    kane = mgm.movies.create({title: "Citizen Kane", creation_year: "1942", genre: "Drama"})
    kong = universal.movies.create({title: "King Kong", creation_year: "1936", genre: "Action"})

    visit "/studios"

    expect(page).to have_content("Name: Paramount Pictures")
    expect(page).to have_content("Location: Hollywood")
    expect(page).to have_content("Name: MGM")
    expect(page).to have_content("Location: Burbank")
    expect(page).to have_content("Name: Universal Studios")
    expect(page).to have_content("Location: Hollywood")
  end

  it "under each studio is a list of that studio's movies" do

    paramount = Studio.create!({name: "Paramount Pictures", location: "Hollywood"})
    mgm = Studio.create!({name: "MGM", location: "Burbank"})
    universal = Studio.create!({name: "Universal Studios", location: "Hollywood"})

    jaws = paramount.movies.create({title: "Jaws", creation_year: "1976", genre: "Action"})
    kane = mgm.movies.create({title: "Citizen Kane", creation_year: "1942", genre: "Drama"})
    kong = universal.movies.create({title: "King Kong", creation_year: "1936", genre: "Action"})

    visit "/studios"
    
    expect(page).to have_content("Title: Jaws")
    expect(page).to have_content("Year: 1976")
    expect(page).to have_content("Genre: Action")

    expect(page).to have_content("Title: Citizen Kane")
    expect(page).to have_content("Year: 1942")
    expect(page).to have_content("Genre: Drama")

    expect(page).to have_content("Title: King Kong")
    expect(page).to have_content("Year: 1936")
    expect(page).to have_content("Genre: Action")
  end
  
end 
require "rails_helper"

RSpec.describe Studio, type: :feature do
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


  describe "As a user, when I visit a studio's show page" do
    it "I see the studio's name and location" do
      visit "/studios/#{@studio1.id}"
      expect(page).to have_content("Sony")
      expect(page).to have_content("Location: Hollywood")

      visit "/studios/#{@studio2.id}"
      expect(page).to have_content("Disney")
      expect(page).to have_content("Location: Orlando")

    end

    it "And I see a unique list of all the actors that have worked on any of this studio's movies" do
      visit "/studios/#{@studio1.id}"
      expect(page).to have_content("Our movies have the following actors:")
      expect(page).to have_content("Actor 1")
      expect(page).to have_content("Actor 2")
      expect(page).to have_content("Actor 3")
      expect(page).to have_content("Actor 6")
      expect(page).to_not have_content("Actor 4")
      expect(page).to_not have_content("Actor 5")

      visit "/studios/#{@studio2.id}"
      expect(page).to have_content("Our movies have the following actors:")
      expect(page).to have_content("Actor 4")
      expect(page).to have_content("Actor 5")
      expect(page).to have_content("Actor 6")
      expect(page).to_not have_content("Actor 1")
      expect(page).to_not have_content("Actor 2")
      expect(page).to_not have_content("Actor 3")

    end
  end
end
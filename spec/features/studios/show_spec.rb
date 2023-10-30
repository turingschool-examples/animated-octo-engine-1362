require "rails_helper"

  RSpec.describe "the studio show" do
    before :each do
      @universal = Studio.create!(name: "Universal Studios", location: "Los Angeles")
      @a24 = Studio.create!(name: "A24", location: "New York")
      @star_wars = Movie.create!(title: "Star Wars", creation_year: "1979", genre: "sci-fi", studio_id: @universal.id)
      @star_wars.actors.create!(name: "Mark Hamill", age: 42)
      @lord = Movie.create!(title: "Lord of the Rings", creation_year: "2000", genre: "fantasy", studio_id: @universal.id)
      @hereditary = Movie.create!(title: "Hereditary", creation_year: "2017", genre: "horror", studio_id: @a24.id)
      @swiss = Movie.create!(title: "Swiss Army Man", creation_year: "2016", genre: "drama", studio_id: @a24.id)
      @hereditary.actors.create!([{name: "Toni Collette", age: 42}, {name: "Alex Wolff", age: 27}, {name: "Milly Shapiro", age: 29}])
      @swiss.actors.create!([{name: "Paul Dano", age: 32}, {name: "Daniel Radcliffe", age: 34}, {name: "Mary Elizabeth Winstead", age: 24}])
    end
  
    it "shows all actors that have worked on any of this studio's movies" do
      visit "/studios/#{@a24.id}"

      expect(page).to have_content("All Actors Who Have Been in this Studio's Movies")
      expect(page).to have_content("Toni Collette")
      expect(page).to have_content("Daniel Radcliffe")
      expect(page).to have_content("Paul Dano")
      expect(page).to have_content("Alex Wolff")
      expect(page).to have_content("Milly Shapiro")
      expect(page).to have_content("Mary Elizabeth Winstead")
      expect(page).to_not have_content("Mark Hamill")
    end
  end
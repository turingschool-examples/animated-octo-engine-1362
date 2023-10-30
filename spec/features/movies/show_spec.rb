require "rails_helper"

  RSpec.describe "the movie show" do
    before :each do
      @universal = Studio.create!(name: "Universal Studios", location: "Los Angeles")
      @a24 = Studio.create!(name: "A24", location: "New York")
      @star_wars = Movie.create!(title: "Star Wars", creation_year: "1979", genre: "sci-fi", studio_id: @universal.id)
      @lord = Movie.create!(title: "Lord of the Rings", creation_year: "2000", genre: "fantasy", studio_id: @universal.id)
      @hereditary = Movie.create!(title: "Hereditary", creation_year: "2017", genre: "horror", studio_id: @a24.id)
      @swiss = Movie.create!(title: "Swiss Army Man", creation_year: "2016", genre: "drama", studio_id: @a24.id)
      @hereditary.actors.create!([{name: "Toni Collette", age: 42}, {name: "Alex Wolff", age: 27}, {name: "Alex Wolff", age: 27},  {name: "Milly Shapiro", age: 29}])
      @swiss.actors.create!([{name: "Paul Dano", age: 32}, {name: "Daniel Radcliffe", age: 34}, {name: "Mary Elizabeth Winstead", age: 24}])
    end

    it "shows movie's attributes" do
      visit "/movies/#{@swiss.id}"

      expect(page).to have_content(@swiss.title)
      expect(page).to have_content(@swiss.creation_year)
      expect(page).to have_content(@swiss.genre)
      expect(page).to_not have_content(@hereditary.title)
    end

    it "shows movie's actors from youngest to oldest" do
      visit "/movies/#{@swiss.id}"

      within('section', :text => "Actors from Youngest to Oldest") do
        expect("Mary Elizabeth").to appear_before("Paul Dano")
        expect("Paul Dano").to appear_before("Daniel Radcliffe")
      end
    end

    it "show average age of all movie's actors" do
      visit "/movies/#{@swiss.id}"
   
      within('section', :text =>  "Average Age of Actors") do
        expect(page).to have_content(30)
      end
    end

    it "has a link to a form" do
      visit "/movies/#{@swiss.id}"

      expect(page).to have_link("Add an actor to this movie")

      click_link("Add an actor to this movie")
      
      expect(current_path).to eq("/movies/#{@swiss.id}/actors/new")
    end
  end
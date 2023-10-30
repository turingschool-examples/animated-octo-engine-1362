require "rails_helper"

RSpec.describe "Index" do 
  before :each do 
    @pixar = Studio.create!(name: "Pixar Studios", location: "Hollywood")
    @mgm = Studio.create!(name: "MGM Studios", location: "Los Angelas")

    @toy_1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "Animation", studio_id: @pixar.id)
    @toy_2 = Movie.create!(title: "Toy Story 2", creation_year: "2000", genre: "Animation", studio_id: @pixar.id)

    @wind = Movie.create!(title: "Wind Talkers", creation_year: "2000", genre: "Drama", studio_id: @mgm.id)
    @rain = Movie.create!(title: "Rain Man", creation_year: "1988", genre: "Drama", studio_id: @mgm.id)
  end

  it "lists studios and their movies" do 
    visit "/studios"

    expect(page).to have_content("Studios Index Page")

    within "#studio-#{@pixar.id}" do 
      expect(page).to have_content(@pixar.name)
      expect(page).to have_content(@pixar.location)

      expect(page).to have_content(@toy_1.title)
      expect(page).to have_content(@toy_1.creation_year)
      expect(page).to have_content(@toy_1.genre)
      
      expect(page).to have_content(@toy_2.title)
      expect(page).to have_content(@toy_2.creation_year)
      expect(page).to have_content(@toy_2.genre)
    end 

    within "#studio-#{@mgm.id}" do 
      expect(page).to have_content(@mgm.name)
      expect(page).to have_content(@mgm.location)

      expect(page).to have_content(@wind.title)
      expect(page).to have_content(@wind.creation_year)
      expect(page).to have_content(@wind.genre)
      
      expect(page).to have_content(@rain.title)
      expect(page).to have_content(@rain.creation_year)
      expect(page).to have_content(@rain.genre)
    end 
  end 
end
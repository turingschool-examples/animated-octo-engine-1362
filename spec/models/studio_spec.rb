require "rails_helper"

RSpec.describe Studio, type: :model do
  describe "relationships" do
    it {should have_many :movies}
  end

  describe "Story 1 - Studio Index, as a user, when I visit the studio index page" do
    describe "I see all of the studios including name and location, and under each studio I see all of the studio's movies
    including the movie's title, creation year, and genre" do

      visit "/studios"

      expect(page).to have_content()





    end

  end
end

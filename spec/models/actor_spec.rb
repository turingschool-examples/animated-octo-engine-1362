require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe "class methods" do
    before :each do
      @woody = Actor.create!(name: "Woody", age: 10)
      @buzz = Actor.create!(name: "Buzz", age: 8)
      @piggy = Actor.create!(name: "Piggy", age: 9)
    end

    describe "#ordered_by_age" do
      it "orders actors by age" do
        expect(Actor.ordered_by_age).to eq(["Buzz", "Piggy", "Woody"])
      end
    end

    describe "#average_age" do
      it "outputs the average age" do
        expect(Actor.average_age).to eq(9)
      end
    end
  end
end
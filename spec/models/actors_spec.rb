require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should have_many :actor_movies}
    it {should have_many(:movies).through(:actor_movies)}
  end

  describe "methods" do
    it "can order actors by age" do
      actor1 = Actor.create!(name: "Harrison Ford", age: 78)
      actor2 = Actor.create!(name: "Karen Allen", age: 69)
      actor3 = Actor.create!(name: "Paul Freeman", age: 79)

      expect(Actor.order_by_age).to eq([actor2, actor1, actor3])
    end

    it "can calculate average age of actors" do
      expect(Actor.average_age).to eq(75)
    end
  end
end
require "rails_helper"

RSpec.describe Actor, type: :model do 
  describe "relationships" do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe "validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_numericality_of :age }
  end

  describe "Model method" do 
    describe "#average_age" do 
      it "returns the average age of all actors" do 
        hanks = Actor.create!(name: "Tom Hanks", age: 42)
        allen = Actor.create!(name: "Tim Allen", age: 41)
        pratt = Actor.create!(name: "Chris Pratt", age: 35)
    
        expect(Actor.average_age).to eq(39.33)
      end
    end 
  end
end
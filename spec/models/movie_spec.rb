require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it { should belong_to :studio }
    it { should have_many :movie_actors }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe "validations" do 
    it { should validate_presence_of :title }
    it { should validate_presence_of :creation_year }
    it { should validate_presence_of :genre }
  end

  describe "Instance method" do 
    describe "#actor_order_age" do 
      it "orders a movies actors by age" do 
        pixar = Studio.create!(name: "Pixar Studios", location: "Hollywood")
        toy_1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "Animation", studio_id: pixar.id)
        hanks = Actor.create!(name: "Tom Hanks", age: 42)
        allen = Actor.create!(name: "Tim Allen", age: 41)
        reeves = Actor.create!(name: "Keanu Reeves", age: 40)
    
        MovieActor.create!(movie_id: toy_1.id, actor_id: hanks.id)
        MovieActor.create!(movie_id: toy_1.id, actor_id: allen.id)
        MovieActor.create!(movie_id: toy_1.id, actor_id: reeves.id)
    
        expect(toy_1.actor_order_age).to eq([reeves, allen, hanks])
      end
    end
  end
end

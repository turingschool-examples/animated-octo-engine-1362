require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it { should belong_to :studio }
    it { should have_many :movie_actors }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:creation_year) }
    it { should validate_presence_of(:genre) }
  end

  describe "methods" do
    before :each do
      @studio_1 = Studio.create!(name: "MAPPA Studio", location: "Suginami")

      @movie_1 = @studio_1.movies.create!(title: "Jujutsu Kaisen", creation_year: "2018", genre: "Adventure Dark", studio_id: @studio_1.id)

      @actor_1 = Actor.create!(name: "Yuji Itadori", age: 15)
      @actor_2 = Actor.create!(name: "Gojo Satoru", age: 29)
      @actor_3 = Actor.create!(name: "Megumi Fushiguro", age: 15)
      @actor_4 = Actor.create!(name: "Maki Zenin", age: 16)
    end

    describe "youngest_first" do
      it "should return actors from youngest to oldest" do
        @movie_1.actors << [@actor_1, @actor_2, @actor_3, @actor_4]
        expect(@movie_1.youngest_first).to eq([@actor_1, @actor_3, @actor_4, @actor_2])
      end
    end

    describe "average_age" do
      it "should return the actors average age" do
        @movie_1.actors << [@actor_1, @actor_2, @actor_3, @actor_4]
        expect(@movie_1.average_age).to eq(18.75)
      end
    end
  end
end

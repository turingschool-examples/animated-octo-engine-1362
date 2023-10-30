require "rails_helper"

RSpec.describe Actor, type: :model do
  before :each do
    test_data
  end

  describe "relationships" do
    it { should have_many :movie_actors}
    it { should have_many(:movies).through(:movie_actors)}
  end

  describe '#self.sort_asc_age' do
    it 'will resort actors by age from youngest to oldest' do
      expected_order = [@sootsprite, @mini_totoro, @catbus]
      expect(@totoro.actors.sort_asc_age).to eq(expected_order)
    end
  end

  describe '#actor_movies(studio_id)' do
    it 'can return the titles of the movies the actor was in per studio id' do
      MovieActor.create!(movie: @monstersinc, actor: @sootsprite)
      titles_expected = [@spiritedaway.title, @totoro.title]
      expect(@sootsprite.actor_movies(@studioghibli.id)).to eq(titles_expected)
      expect(@sootsprite.movies.include?(@monstersinc)).to eq(true)
    end
  end

end

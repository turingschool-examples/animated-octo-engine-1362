require "rails_helper"

RSpec.describe Studio, type: :model do
  before :each do
    test_data
  end

  describe "relationships" do
    it {should have_many :movies}
  end

  describe '#actors_featured' do
    it 'can return the actors per that studio' do
      studioghibli_actors = [@noface, @mini_totoro, @sootsprite, @catbus]
      expect(@studioghibli.actors_featured).to eq(studioghibli_actors)
    end
  end
  
end

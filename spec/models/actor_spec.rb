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
end

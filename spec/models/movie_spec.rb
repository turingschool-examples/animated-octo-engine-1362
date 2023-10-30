require "rails_helper"

RSpec.describe Movie, type: :model do
  before :each do
    test_data
  end

  describe "relationships" do
    it {should belong_to :studio}
    it { should have_many :movie_actors}
    it { should have_many(:actors).through(:movie_actors)}
  end

  describe '#average_age' do
    it 'can return the average age of actors per movie' do
      average_age = @totoro.actors.pluck(:age).sum.div(@totoro.actors.count)
      expect(@totoro.average_age.to_i).to eq(average_age)
    end
  end

end

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
    it { should validate_numericality_of(:creation_year) }
  end
end

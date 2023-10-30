require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it { should have_many :actor_movies }
    it { should have_many(:movies).through(:actor_movies) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_numericality_of(:age) }
  end
end
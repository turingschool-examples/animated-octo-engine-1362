require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe 'actors_list' do
    it 'lists the actors from youngest to oldest' do
      @us = Studio.create!(name: 'Universal Studio', location: 'Hollywood')

      @marry = @us.movies.create!(title: 'Marry Me', creation_year: '2022', genre: 'Romance')
  
      @jenni = Actor.create!(name: 'Jennifer Lopez', age: 54)
      @owen = Actor.create!(name: 'Owen Wilson', age: 55)
      @sarah = Actor.create!(name: 'Sarah Silverman', age: 52)
      @chloe = Actor.create!(name: 'Chloe Coleman', age: 14)
  
      MovieActor.create!(movie: @marry, actor: @jenni)
      MovieActor.create!(movie: @marry, actor: @owen)
      MovieActor.create!(movie: @marry, actor: @sarah)
      MovieActor.create!(movie: @marry, actor: @chloe)

      expect(@marry.actors_list).to eq([@chloe, @sarah, @jenni, @owen])
    end
  end
end

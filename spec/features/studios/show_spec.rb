require 'rails_helper'

RSpec.describe "Studio Index Page" do
  before(:each) do
    test_data
  end

  describe '#Viewing the Studio Show Page - US 4' do
    it 'when viewing the show page, there is the studio name and location' do
      visit "/studios/#{@studioghibli.id}"
      expect(page).to have_content(@studioghibli.name)
      expect(page).to have_content(@studioghibli.location)
    end

    xit 'also includes a unique list of all the actors that have been in any of the studio movies' do
      visit "/studios/#{@studioghibli.id}"
      studio_actors = []
      @studioghibli.movies.each{|movie| studio_actors << movie.actors}
      studio_actors.each do |actor|
        expect(page).to have_content(actor.name)
      end
    end
end

end
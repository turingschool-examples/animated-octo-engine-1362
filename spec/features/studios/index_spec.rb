require 'rails_helper'

RSpec.describe '/studios' do
  before :each do
    @us = Studio.create!(name: 'Universal Studio', location: 'Hollywood')
    @para = Studio.create!(name: 'Paramount Pictures', location: 'Hollywood')

    @marry = @us.movies.create!(title: 'Marry Me', creation_year: '2022', genre: 'Romance')
    @house = @us.movies.create!(title: 'House of Gucci', creation_year: '2021', genre: 'Drama')

    @mission = @para.movies.create!(title: 'Mission Impossible 2', creation_year: '2000', genre: 'Action')
    @kungfu = @para.movies.create!(title: 'Kung Fu Panda', creation_year: '2008', genre: 'Anime')
  end

  describe 'as a visitor' do
    describe 'when I visit /studios' do
      it 'shows all the studios name, location' do
        visit '/studios'

        within("#studio-#{@us.id}") do
          expect(page).to have_content('Studio Name: Universal Studio')
          expect(page).to have_content('Studio Location: Hollywood')
        end

        within("#studio-#{@para.id}") do
          expect(page).to have_content('Studio Name: Paramount Pictures')
          expect(page).to have_content('Studio Location: Hollywood')
        end
      end

      it 'shows all the movies associated with studios, including movie title, creation year and genre' do
        visit '/studios'

        within("#movie-#{@us.id}") do
          expect(page).to have_content('Movie Title: Marry Me')
          expect(page).to have_content('Movie Creation Year: 2022')
          expect(page).to have_content('Movie Genre: Romance')
          expect(page).to have_content('Movie Title: House of Gucci')
          expect(page).to have_content('Movie Creation Year: 2021')
          expect(page).to have_content('Movie Genre: Drama')
        end

        within("#movie-#{@para.id}") do
          expect(page).to have_content('Movie Title: Mission Impossible 2')
          expect(page).to have_content('Movie Creation Year: 2000')
          expect(page).to have_content('Movie Genre: Action')
          expect(page).to have_content('Movie Title: Kung Fu Panda')
          expect(page).to have_content('Movie Creation Year: 2008')
          expect(page).to have_content('Movie Genre: Anime')
        end
      end
    end
  end
end
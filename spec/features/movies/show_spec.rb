# require 'rails_helper'

# RSpec.describe '/movies/:id' do
#   before :each do
#     @us = Studio.create!(name: 'Universal Studio', location: 'Hollywood')
#     @para = Studio.create!(name: 'Paramount Pictures', location: 'Hollywood')

#     @marry = @us.movies.create!(title: 'Marry Me', creation_year: '2022', genre: 'Romance')
#     @marry = @us.movies.create!(title: 'House of Gucci', creation_year: '2021', genre: 'Drama')

#   end

#   describe 'as a visitor' do
#     describe 'when I visit /studios' do
#       it 'shows all the studios name, location' do
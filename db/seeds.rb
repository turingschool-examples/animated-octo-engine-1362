# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@us = Studio.create!(name: 'Universal Studio', location: 'Hollywood')

@marry = @us.movies.create!(title: 'Marry Me', creation_year: '2022', genre: 'Romance')

@jenni = Actor.create!(name: 'Jennifer Lopez', age: 54)
@owen = Actor.create!(name: 'Owen Wilson', age: 55)
@sarah = Actor.create!(name: 'Sarah Silverman', age: 52)
@chloe = Actor.create!(name: 'Chloe Coleman', age: 14)
@john = Actor.create!(name: 'John Bradley', age: 35)

MovieActor.create!(movie: @marry, actor: @jenni)
MovieActor.create!(movie: @marry, actor: @owen)
MovieActor.create!(movie: @marry, actor: @sarah)
MovieActor.create!(movie: @marry, actor: @chloe)
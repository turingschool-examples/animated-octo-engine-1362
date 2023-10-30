# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

lucasfilm = Studio.create(name: "Lucasfilm", location: "Burbank, CA")
conaco = Studio.create(name: "Conaco", location: "Hollywood, CA")

movie1 = lucasfilm.movies.create(title: "Star Wars", creation_year: "1977", genre: "Sci-fi")
movie2 = conaco.movies.create(title: "Hans and Frans Big Adventure", creation_year: "1993", genre: "Comedy")

actor1 = Actor.create(name: "Mark Hammil", age: 23)
actor2 = Actor.create(name: "Arnold Swarzenneger", age: 27)

ActorMovie.create(actor: actor1, movie: movie1)
ActorMovie.create(actor: actor2, movie: movie2)

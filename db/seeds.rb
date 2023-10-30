# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@studio_1 = Studio.create(name: "Disney", location: "Hollywood")
@studio_2 = Studio.create(name: "Universal", location: "Hollywood")
@movie_1 = @studio_1.movies.create(title: "Star Wars: The Last Jedi", creation_year: "2017", genre: "Sci-fi")
@movie_2 = @studio_2.movies.create(title: "Batman: The Killing Joke", creation_year: "2016", genre: "Animated")
@actor_1 = Actor.create(name: "Mark Hamill", age: 72)
@actor_2 = Actor.create(name: "Kevin Conroy", age: 66)
@actor_3 = Actor.create(name: "Adam Driver", age: 39)
ActorMovie.create(movie: @movie_1, actor: @actor_1)
ActorMovie.create(movie: @movie_2, actor: @actor_1)
ActorMovie.create(movie: @movie_1, actor: @actor_3)
ActorMovie.create(movie: @movie_2, actor: @actor_2)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Studios

@studio_1 = Studio.create!(name: "Paramount", location: "Hollywood")
@studio_2 = Studio.create!(name: "Fox Searchlight Pictures", location: "Los Angeles")
@studio_3 = Studio.create!(name: "Mosfilm", location: "Moscow")

# Movies

@movie_1 = @studio_1.movies.create!(title: "Killers of the Flower Moon", creation_year: 2023, genre: "crime noir")
@movie_2 = @studio_1.movies.create!(title: "The Truman Show", creation_year: 1998, genre: "drama")
@movie_3 = @studio_2.movies.create!(title: "The Tree of Life", creation_year: 2011, genre: "drama")
@movie_4 = @studio_2.movies.create!(title: "A Hidden Life", creation_year: 2019, genre: "drama")
@movie_5 = @studio_3.movies.create!(title: "Stalker", creation_year: 1979, genre: "science fiction")

# Actors

@actor_1 = Actor.create!(name: "Robert DeNiro", age: 80)
@actor_2 = Actor.create!(name: "Leonardo DiCaprio", age: 48)
@actor_3 = Actor.create!(name: "Lily Gladstone", age: 37)

# Movie_Actors

@movie_actor_1 = MovieActor.create!(movie: @movie_1, actor: @actor_1)
@movie_actor_2 = MovieActor.create!(movie: @movie_1, actor: @actor_2)
@movie_actor_3 = MovieActor.create!(movie: @movie_1, actor: @actor_3)
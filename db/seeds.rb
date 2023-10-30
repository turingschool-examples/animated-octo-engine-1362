# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@studio1 = Studio.create!(name: "Sony", location: "Hollywood")
@studio2 = Studio.create!(name: "Disney", location: "Orlando")
@movie1 = @studio1.movies.create!(title: "Spiderman", creation_year: "2002", genre: "superhero")
@movie2 = @studio2.movies.create!(title: "Frozen", creation_year: "2013", genre: "animation")
@movie3 = @studio2.movies.create!(title: "Up", creation_year: "2009", genre: "animation")
@actor1 = @movie1.actors.create!(name: "Actor 1", age: "20")
@actor2 = @movie1.actors.create!(name: "Actor 2", age: "10")
@actor3 = @movie1.actors.create!(name: "Actor 3", age: "30")
@actor4 = @movie2.actors.create!(name: "Actor 4", age: "40")
@actor5 = @movie2.actors.create!(name: "Actor 5", age: "50")
@actor6 = @movie3.actors.create!(name: "Actor 6", age: "60")

@movie1.actors << @actor6
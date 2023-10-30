# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@universal = Studio.create!(name: "Universal Studios", location: "Hollywood ,CA") 
@warner_bros = Studio.create!(name: "Warner Bros", location: "Burbank ,CA") 

@jurassic_park = @universal.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Action and Adventure")
@bruce_almighty = @universal.movies.create!(title: "Bruce Almighty", creation_year: 2003, genre: "Comedy")
@the_dark_knight = @warner_bros.movies.create!(title: "The Dark Knight", creation_year: 2008, genre: "Action and Drama")
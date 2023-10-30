# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
      studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      studio2 = Studio.create!(name: "Disney", location: "Hollywood")
      studio3 = Studio.create!(name: "Warner Bros", location: "Hollywood")

      movie1 = studio1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure")
      movie4 = studio1.movies.create!(title: "Jaws", creation_year: 1975, genre: "Action/Adventure")
      movie2 = studio2.movies.create!(title: "A New Hope", creation_year: 1977, genre: "Action/Adventure")
      movie5 = studio2.movies.create!(title: "The Lion King", creation_year: 1994, genre: "Family")
      movie3 = studio3.movies.create!(title: "The Dark Knight", creation_year: 2008, genre: "Action/Adventure")
      movie6 = studio3.movies.create!(title: "The Matrix", creation_year: 1999, genre: "Action/Adventure")
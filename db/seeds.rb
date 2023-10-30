# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@studio1 = Studio.create(name: "Universal Studios", location: "Hollywood")
@studio2 = Studio.create(name: "Nathan's Studios", location: "Denver")

@movie1 = @studio1.movies.create(title: 'Toy Story', creation_year: '1995', genre: 'animation')
@movie2 = @studio1.movies.create(title: 'Elephant Christmas', creation_year: '1997', genre: 'romance')
@movie3 = @studio2.movies.create(title: 'Halloween Boy', creation_year: '2023', genre: 'comedy')
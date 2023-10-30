# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
studio2 = Studio.create!(name: "Disney", location: "Orlando")
studio3 = Studio.create!(name: "Underground", location: "New York")

movie1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "animation", studio: studio1)
movie2 = Movie.create!(title: "Django", creation_year: "2019", genre: "comedy", studio: studio3)
movie3 = Movie.create!(title: "Mission Impossible", creation_year: "2015", genre: "action", studio: studio1)
movie4 = Movie.create!(title: "Barbie", creation_year: "2023", genre: "comedy", studio: studio1)
movie5 = Movie.create!(title: "Oppenheimer", creation_year: "2023", genre: "documentary", studio: studio1)
movie6 = Movie.create!(title: "frozen", creation_year: "2012", genre: "animation", studio: studio2)

Actor.create!(name: "Meryl Streep", age: 73)

studio1.movies << movie1
studio1.movies << movie3
studio1.movies << movie4
studio1.movies << movie5

studio2.movies << movie6
studio3.movies << movie2
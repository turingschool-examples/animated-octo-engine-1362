# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    @studio_1 = Studio.create(name: "Sleepy Time Movies", location: "OKC")
    @studio_2 = Studio.create(name: "Show Biz Productions", location: "LA")
    @movie_1 = @studio_1.movies.create(title: "Blaine's Big Day", creation_year: '2023', genre: 'Tragedy')
    @movie_2 = @studio_2.movies.create(title: 'Sloppy Code', creation_year: '2023', genre: 'Horror')

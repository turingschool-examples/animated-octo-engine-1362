# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@studioghibli = Studio.create!(name: "Studio Ghibli", location: "1-1-83 Shimorenjaku, Mitaka Tokyo 181-0013")
  @pixar = Studio.create!(name: "Pixar Animation", location:"1200 Park Ave, Emeryville, CA")

  @spiritedaway = @studioghibli.movies.create!(title: "Spirited Away", creation_year: "2001", genre: "fantasy")
  @totoro = @studioghibli.movies.create!(title: "Totoro", creation_year: "1988", genre: "fantasy")
  @princessmononoke = @studioghibli.movies.create!(title: "Princess Mononoke", creation_year: "1997", genre: "fantasy")
  @monstersinc = @pixar.movies.create!(title: "Monsters Inc", creation_year: "2001", genre: "fantasy")

  @noface = Actor.create!(name: "No Face", age: 10000)
  @mini_totoro = Actor.create!(name: "Mini Totoro", age: 200)
  @sootsprite = Actor.create!(name: "Soot Sprite", age: 2)
  @catbus = Actor.create!(name: "Cat Bus", age: 400)
  @mike = Actor.create!(name: "Mike Wazowski", age: 40)
  @baby_totoro = Actor.create!(name: "Baby Totoro", age: 140)

  MovieActor.create!(movie: @spiritedaway, actor: @noface)
  MovieActor.create!(movie: @spiritedaway, actor: @sootsprite)
  MovieActor.create!(movie: @totoro, actor: @mini_totoro)
  MovieActor.create!(movie: @totoro, actor: @sootsprite)
  MovieActor.create!(movie: @totoro, actor: @catbus)
  MovieActor.create!(movie: @princessmononoke, actor: @sootsprite)
  MovieActor.create!(movie: @monstersinc, actor: @mike)

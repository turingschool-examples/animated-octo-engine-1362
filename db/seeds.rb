ghibli = Studio.create!(name: "Studio Ghibli", location: "Tokyo")
A24 = Studio.create!(name: "A24", location: "New York City")
universal = Studio.create!(name: "Universal Pictures", location: "Hollywood")
walt_disney = Studio.create!(name: "Walt Disney", location: "Burbank")

mononoke = ghibli.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Action")
spirited_away = ghibli.movies.create!(title: "Spirited Away", creation_year: 2001, genre: "Adventure")
uncut_gems = A24.movies.create!(title: "Uncut Gems", creation_year: 2019, genre: "Crime/Thriller")
talk_to_me = A24.movies.create!(title: "Talk To Me", creation_year: 2022, genre: "Supernatural/Horror")
jurassic = universal.movies.create!(title: "Jurassic World", creation_year: 2015, genre: "Science Fiction")
ex_machina = universal.movies.create!(title: "Ex-Machina", creation_year: 2014, genre: "Science Fiction/Psychological Thriller")
ralph = walt_disney.movies.create!(title: "Wreck It Ralph", creation_year: 2012, genre: "Comedy")
frozen = walt_disney.movies.create!(title: "Frozen", creation_year: 2013, genre: "Musical Fantasy")
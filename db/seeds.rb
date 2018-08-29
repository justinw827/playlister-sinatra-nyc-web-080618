# Add seed data here. Seed your database with `rake db:seed`

Artist.destroy_all
Genre.destroy_all
Song.destroy_all
SongGenre.destroy_all

artist1 = Artist.create({name: "My Name 1"})
artist2 = Artist.create({name: "My Name 2"})
artist3 = Artist.create({name: "My Name 3"})

genre1 = Genre.create({name: "My Genre 1"})
genre2 = Genre.create({name: "My Genre 2"})
genre3 = Genre.create({name: "My Genre 3"})

song1=Song.create({name:'s1', artist_id: artist1.id})
song2=Song.create({name:'s2', artist_id: artist2.id})

song_genre1 = SongGenre.create({song_id: song1.id, genre_id:genre1.id})
song_genre2 = SongGenre.create({song_id: song2.id, genre_id:genre2.id})

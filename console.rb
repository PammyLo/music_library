require_relative('./artist.rb')
require_relative('./album.rb')
require ('pry')



artist_1 = {'name' => 'Tom Jones'}
tom_jones = Artist.new(artist_1)
tom_jones.save

album_1 = {'title' => 'Blue Moon', 'genre' => 'Pop', 'artist_id' => tom_jones.id}
blue_moon = Album.new(album_1)

blue_moon.save

p Album.all
p Artist.all
# binding.pry

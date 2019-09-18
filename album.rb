require_relative('./db/sql_runner.rb')
require_relative('./artist.rb')

class Album

attr_accessor :title, :genre
attr_reader :id

  def initialize(details)
    @id = details['id'] if details['id']
    @title = details['title']
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i
  end

  def save
    sql = 'INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING id'
    values = [@title, @genre, @artist_id]
    new_album = SqlRunner.run(sql, values)
    @id = new_album[0]['id'].to_i
  end

  def Album.all
    sql = 'SELECT * FROM albums'
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

end

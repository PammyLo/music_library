require_relative('./db/sql_runner.rb')
require_relative('./album.rb')

class Artist

attr_accessor :name
attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save
    sql = 'INSERT INTO artists (name)
    VALUES ($1) RETURNING id'
    values = [@name]
    new_artist = SqlRunner.run(sql, values)
    @id = new_artist[0]['id'].to_i
  end

  def Artist.all
    sql = 'SELECT * FROM artists'
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist)  }
  end

  def all_albums
    sql = 'SELECT * FROM albums
    WHERE id = $1'
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map { |album| Album.new(album) }
  end

end

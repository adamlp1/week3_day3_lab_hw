require('pg')
require_relative('../db/sql_runner')
class Artist

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ( $1 )
    RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    artist_data = results[0]
    artist = Artist.new(artist_data)
    @id = results[0]['id'].to_i
    return artist
  end

  def self.delete_all
    sql = "DELETE FROM artists;"
    results = SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end

  def album_by_artist()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    artists = SqlRunner.run(sql, values)
    albums = artists.map { |album| Album.new(album) }
    return albums
  end

  def update()
      sql = "UPDATE artist SET (
      name
    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@name, @id]
    result = SqlRunner.run(sql, values)
    return result
  end




end

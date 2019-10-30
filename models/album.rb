require('pg')
require_relative('../db/sql_runner')
class Album

  attr_accessor :title, :genre
  attr_reader :artist_id, :id

  def initialize( options )
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
     VALUES ( $1, $2, $3 )
    RETURNING id;"
    values = [@title, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    album_data = results[0]
    album = Album.new(album_data)
    # @id = results[0]['id'].to_i
    return album
  end

  def self.delete_all
    sql = "DELETE FROM albums;"
    results = SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

  def artist_by_album()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    albums = SqlRunner.run(sql, values)
    artists = albums.map { |artist| Artist.new(artist) }
    return artists
  end

  def update()
    sql = "UPDATE albums SET (
    title,
    genre
  ) =
  (
    $1, $2
  )
  WHERE id = $3"
  values = [@title, @genre, @id]
  result = SqlRunner.run(sql, values)
  return result
end










end

require('pg')

class Album

  attr_accessor :title, :genre
  attr_reader :artist_id, :id

  def initialize( options )
    @title = options['title'],
    @genre = options['genre'],
    @artist_id = options['id'],
    @id = options['id'].to_i if options['id']
  end



end

require('pg')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @name = options['name'],
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ( $1 )
    RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    artists = results.map { |artist| Artist.new(artist) }
  end


end

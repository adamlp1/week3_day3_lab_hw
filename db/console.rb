require('pry')
require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all
Artist.delete_all


artist1 = Artist.new( {
  'name' => 'Drake'
  });
  artist1.save()

artist2 = Artist.new( {
  'name' => 'Kanye West'
  });
artist2.save()

album1 = Album.new( {
  'title' => 'Scorpion',
  'genre' => 'HipHop',
  'artist_id' => artist1.id
  });
album1.save()

album2 = Album.new( {
  'title' => 'Views From the 6',
  'genre' => 'HipHop',
  'artist_id' => artist1.id
  });
album2.save()

album3 = Album.new( {
  'title' => 'Jesus is King',
  'genre' => 'Gospel',
  'artist_id' => artist2.id
  });
album3.save 

binding.pry
  nil

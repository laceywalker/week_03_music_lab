require('pry')
require_relative('../models/album')
require_relative('../models/artist')


Album.delete_all()
Artist.delete_all()



artist1 = Artist.new( {'first_name' => 'Bon', 'last_name' => 'Jovi', 'age' => '55'})
artist1.save

artist2 = Artist.new( {'first_name' => 'celine', 'last_name' => 'dion', 'age' => '150'})
artist2.save

album1 = Album.new({ 'name_of_album' => 'bonJovi_s world', 'year_released' => '1987','artist_id' => artist1.id})
album1.save


album2 = Album.new({ 'name_of_album' => 'fire_world', 'year_released' => '1999', 'arist_id' => artist1.id})


album2.save
















binding.pry
nil

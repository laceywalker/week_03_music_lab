require('pry')
require_relative('../models/album')
require_relative('../models/artist')


# Album.delete_all()
Artist.delete_all()



artist1 = Artist.new( {'first_name' => 'Bon', 'last_name' => 'Jovi', 'age' => '55'})
artist1.save

artist2 = Artist.new( {'first_name' => 'celine', 'last_name' => 'dion', 'age' => '150'})
artist2.save



















binding.pry
nil

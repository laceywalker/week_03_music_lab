require('pg')
require_relative('../db/sql_runner')
require_relative('artist')


class Album

  attr_accessor :name_of_album, :year_released, :artist_id
  attr_reader :id

  def initialize(options)
    @name_of_album = options['name_of_album']
    @year_released = options['year_released'].to_i
    @id = options['id'] if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def artist()
    db = PG.connect({ dbname: 'music_library', host: 'localhost' })
    values = [@artist_id]
    result = Sql.run(sql, values)
    artist_hash = result[0]
    return Artist.new(artist_hash)
  end


  def save()
    db = PG.connect({ dbname: 'music_library', host: 'localhost' })
    sql = "INSERT INTO albums (
      name_of_album,
      year_released
    ) VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name_of_album, @year_released]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close()
  end


  def Album.delete_all()
    db = PG.connect({ dbname: 'music_library', host: 'localhost' })
    sql = "DELETE FROM albums"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def Album.all()
    db = PG.connect({ dbname: 'music_library', host: 'localhost' })
    sql = "SELECT * FROM albums"
    db.prepare("all", sql)
    albums = db.exec_prepared("all")
    db.close
    return albums.map { |album| Album.new(album) }
  end

end

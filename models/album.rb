require('pg')
require_relative('../db/sql_runner')
require_relative('artist')


class Album

  attr_accessor :name_of_album, :year_released

  def initialize(options)
    @name_of_album = options['name_of_album']
    @year_released = options['year_released'].to_i
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


end

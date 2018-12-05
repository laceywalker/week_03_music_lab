require('pg')
require_relative('../db/sql_runner')
require_relative('album')


class Artist

  attr_accessor :first_name, :last_name, :age, :album_id
  attr_reader :id

    def initialize(options)
      @first_name = options['first_name']
      @last_name = options['last_name']
      @age = options['age'].to_i
      @id = options['id'].to_i if options['id']
    end


    def album
      db = PG.connect({ dbname: 'music_library', host: 'localhost' })
      sql = "SELECT * FROM albums WHERE artist_id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)
      return result.map {|album| Album.new(album)}
    end

    def save()              #this did me a confuzle -- why don't i have to add an extra parameter here?
      db = PG.connect({ dbname: 'music_library', host: 'localhost' })
      sql = "INSERT INTO artists (
        first_name,
        last_name,
        age
      ) VALUES
      (
        $1, $2, $3
      )
      RETURNING id"
      values = [@first_name, @last_name, @age]
      db.prepare("save", sql)
      @id = db.exec_prepared("save", values)[0]["id"].to_i
      db.close()
    end

    def Artist.delete_all()
      db = PG.connect({ dbname: 'music_library', host: 'localhost' })
      sql = "DELETE FROM artists"
      db.prepare("delete_all", sql)
      db.exec_prepared("delete_all")
      db.close()
    end

    def Artist.all()
      db = PG.connect({ dbname: 'music_library', host: 'localhost' })
      sql = "SELECT * FROM artists"
      db.prepare("all", sql)
      artists = db.exec_prepared("all")
      db.close
      return artists.map { |artist| Artist.new(artist) }
    end





  end

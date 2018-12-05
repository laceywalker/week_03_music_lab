require('pg')
require_relative('../db/sql_runner')
require_relative('artist')


class Album

  attr_accessor :name_of_album, :year_released
  
  def initialize(options)
    @name_of_album = options['name_of_album']
    @year_released = options['year_released'].to_i
  end









end

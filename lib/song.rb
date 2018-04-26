require 'pry'
class Song
  attr_accessor :name, :artist, :title
  
  def initialize(name)
    @name = name
  end
  
  def artist_name=(name)
    Artist.find_or_create_by_name(@name)
  end
  
  def self.new_by_filename(filename)
    file_arr = filename.split(" - ")
    song = self.new(filename)
    song.name = file_arr[1]
    song.artist_name = Artist.find_or_create_by_name(file_arr[0]) 
    song
  end

end
require 'pry'
class MP3Importer
  attr_accessor :path, :files 
  
  
  def initialize(test_music_path)
    @path = test_music_path
  end
  
  def files 
    @files = Dir.glob(@path + "/*")
    @files.map {|f| f.sub("#{@path}/", "")}
  end
  
  def import
    self.files.each do |file|
      Artist.all << Song.new_by_filename(file)
    end
  end
end
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.each { |song| return song if song.name == song_name }
    nil
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) ? self.find_by_name(title) : self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort {|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(file_format)
    name_and_title = file_format.split(/[.-]/)
    song = self.new
    song.name = name_and_title[1].strip
    song.artist_name = name_and_title[0].strip
    song
  end

  def self.create_from_filename(file_format)
    name_and_title = file_format.split(/[.-]/)
    song = self.new
    song.name = name_and_title[1].strip
    song.artist_name = name_and_title[0].strip
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
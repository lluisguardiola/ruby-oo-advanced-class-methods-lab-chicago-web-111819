require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song if !@@all.include?(song)
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song.name if !@@all.include?(song.name)
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find { |x| x.name == name  }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |a| a.name }
  end

  def self.new_from_filename(file_name)
    x = file_name.split(" - ")
    artist_name = x[0]
    name = x[1].chomp(".mp3")

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    x = file_name.split(" - ")
    artist_name = x[0]
    name = x[1].chomp(".mp3")

    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

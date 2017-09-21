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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name).nil?
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    # self.all.sort {|a,b| a.name <=> b.name}
    self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    artist, song_name = filename.chomp(".mp3").split(" - ")
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist
    new_song.save
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end

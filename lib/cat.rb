class Cat
  # code goes here
  @@all = []
  attr_reader :name, :owner, :mood
  attr_writer :owner, :mood
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
end
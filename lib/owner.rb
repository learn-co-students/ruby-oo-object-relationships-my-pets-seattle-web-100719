require_relative 'cat.rb'
require_relative 'dog.rb'

class Owner
    
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def buy_cat(petName)
    Cat.new(petName, self)
  end

  def buy_dog(petName)
    Dog.new(petName, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def sell_pets
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end

    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end

  def self.reset_all
    @@all.each do |pet|
      pet = nil
    end

    @@all.clear
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

end
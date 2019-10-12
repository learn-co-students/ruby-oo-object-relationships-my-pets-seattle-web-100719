class Owner
  @@all = []
  attr_reader :name, :species, :cat, :dog
  # code goes here
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats 
    Cat.all.filter{|cat| cat.owner == self}
  end

  def dogs 
    Dog.all.filter{|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.map{|dog| dog.mood = "happy"}
  end

  def feed_cats 
    Cat.all.map{|cat| cat.mood = "happy"}
  end

  def sell_pets
    my_dogs = Dog.all
                .filter{|dog| dog.owner == self}
                .each{|dog| dog.mood = "nervous"}
                .each{|dog| dog.owner = nil}
    my_cats = Cat.all
                .filter{|cat| cat.owner == self}
                .each{|cat| cat.mood = "nervous"}
                .each{|cat| cat.owner = nil}
  end

  def list_pets
    number_of_cats = Cat.all.filter{|cat| cat.owner == self}.length
    number_of_dogs = Dog.all.filter{|dog| dog.owner == self}.length
    "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
  end

end
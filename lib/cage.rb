class Cage
  attr_accessor :animal

  def initialize(animal = nil)
    @animal = animal
  end
  
  def empty?
    animal.nil?
  end
end

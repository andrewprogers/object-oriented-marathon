class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :cages, :employees

  def initialize(name, opening_date, closing_date)
    @name = name
    @opening_date = opening_date
    @closing_date = closing_date
    @cages = Array.new(10) { Cage.new }
    #10.times { @cages << Cage.new }
    @employees = []
  end

  def add_employee(person)
    @employees << person
  end

  def open?(date)
    (@opening_date..@closing_date).include?(date)
  end

  def add_animal(animal_to_be_added)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal_to_be_added
        return
      end
    end
    raise ZooAtCapacity
  end

  def visit
    greetings = ""
    @employees.each do |employee|
      greetings += "#{employee.greet}\n"
    end
    @cages.each do |cage|
      unless cage.animal.nil?
        greetings += "#{cage.animal.speak}\n"
      end
    end
    greetings
  end
end

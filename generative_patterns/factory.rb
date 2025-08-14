# Factory pattern using to create different subtypes of objects from the one place
#
# Interface for all animals
class Animal
  def legs_count
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def has_tail?
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def sound
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Cat < Animal
  def legs_count
    4
  end

  def has_tail?
    true
  end

  def sound
    "Meow"
  end
end

class Dog < Animal
  def legs_count
    4
  end

  def has_tail?
    true
  end

  def sound
    "Woof"
  end
end

class Snake < Animal
  def legs_count
    0
  end

  def has_tail?
    false
  end

  def sound
    "Shhhhhh"
  end
end

class AnimalFactory
  def self.create(animal_type)
    case animal_type
    when "cat"
      Cat.new
    when "dog"
      Dog.new
    when "snake"
      Snake.new
    else
      raise StandardError, "Invalid animal type: #{animal_type}"
    end
  end
end

def animal_interactor(animal_type)
  animal = AnimalFactory.create(animal_type)
  
  puts "This animal has #{animal.legs_count} legs"
  puts animal.has_tail? ? "This animal has tail" : "This animal does not have tail"
  puts "This animal says #{animal.sound}"
rescue StandardError => e
  puts e.message
end

puts "Work with cat"
animal_interactor("cat") # => got info about cat

puts "Work with dog"
animal_interactor("dog") # => got info about dog

puts "Work with snake"
animal_interactor("snake") # => got info about snake

puts "Work with elephant"
animal_interactor("elephant") # => got error message: `Invalid animal type: elephant`

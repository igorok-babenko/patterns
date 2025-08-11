# Interface of an abstract factory of the restaurants
class AbstractRestaurant
  def create_hot_dog
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_burger
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Factory for specific restaurant
class EatyFactory < AbstractRestaurant
  def create_hot_dog
    EatyHotDog.new
  end

  def create_burger
    EatyBurger.new
  end
end

# Factory for specific restaurant
class TeremokFactory < AbstractRestaurant
  def create_hot_dog
    TeremokHotDog.new
  end

  def create_burger
    TeremokBurger.new
  end
end

# Basic interface for the hot dogs
class HotDog
  def description
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Basic interface for the burgers
class Burger
  def description
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Class for specific restaurant's hot dog
class TeremokHotDog < HotDog
  def description
    puts "It's a hot dog from the Teremok"
  end
end

# Class for specific restaurant's burger
class TeremokBurger < Burger
  def description
    puts "It's a burger from the Teremok"
  end
end

# Class for specific restaurant's hot dog
class EatyHotDog < HotDog
  def description
    puts "It's a hot dog from the Eaty"
  end
end

# Class for specific restaurant's burger
class EatyBurger < Burger
  def description
    puts "It's a burger from the Eaty"
  end
end

# Application code works with restaurants only by abstract interfaces
def application_action(factory)
  hot_dog = factory.create_hot_dog
  burger = factory.create_burger
  
  puts hot_dog.description
  puts burger.description
end

# Testing of the Eaty Facroty
application_action(EatyFactory.new)

# Testing of the Teremok Facroty
application_action(TeremokFactory.new)

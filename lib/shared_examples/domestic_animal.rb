require_relative 'animal'

class DomesticAnimal < Animal
  attr_reader :happiness

  def initialize(name)
    super(name)
    @happiness = 50
  end

  def pet
    @happiness += 10
    puts "#{name} is happy"
  end
end

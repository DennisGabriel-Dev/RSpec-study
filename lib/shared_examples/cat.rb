require_relative 'domestic_animal'

class Cat < DomesticAnimal
  def make_sound
    "Meow!"
  end

  def hunt(prey)
    "#{name} caugh a #{prey}!"
  end
end

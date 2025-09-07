require_relative 'domestic_animal'

class Dog < DomesticAnimal
  def make_sound
    "Huf huf!"
  end

  def fetch(item)
    "#{name} fetched the #{item}!"
  end
end

require_relative 'animal'

class Lion < Animal
  def make_sound
    "ROAR!"
  end

  def hunt(prey)
    "#{name} is hunting #{prey} with the pack!"
  end
end

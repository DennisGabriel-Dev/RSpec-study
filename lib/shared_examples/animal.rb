class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_sound
    raise NotImplementedError, 'Subclass must implement make_sound'
  end
end

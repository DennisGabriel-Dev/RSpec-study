class User
  attr_accessor :name, :email, :age

  def initialize(name, email, age)
    @name = name
    @email = email
    @age = age
  end

  def adult?
    @age >= 18
  end

  def greeting
    "Hello, #{name}!"
  end

  def change_email(new_email)
    unless new_email.include?('@')
      raise ArgumentError, "E-mail inválido"
    end

    @email = new_email
  end
end

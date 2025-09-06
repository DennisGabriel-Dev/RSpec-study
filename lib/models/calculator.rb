class Calculator
  def sum(a, b)
    a + b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    raise ZeroDivisionError, "Cannot divide by zero" if b == 0
    a / b
  end
end

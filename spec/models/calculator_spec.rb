require 'models/calculator.rb'

RSpec.describe Calculator do
  describe '#sum' do
    it 'adds two numbers correctly' do
      calc = Calculator.new
      result = calc.sum(1, 2)
      expect(result).to eq(3)
    end

    it 'handle a negative sum' do
      calc = Calculator.new
      result = calc.sum(-3, 2)
      expect(result).to eq(-1)
    end
  end

  describe '#multiply' do
    it 'multiply two numbers correctly' do
      calc = Calculator.new
      result = calc.multiply(2, 8)
      expect(result).to eq(2 * 8)
    end

    it 'multiply by zero' do
      calc = Calculator.new
      result = calc.multiply(2, 0)
      expect(result).to eq(0)
    end

    it 'same number, multiply by 1' do
      calc = Calculator.new
      num = 5
      result = calc.multiply(num, 1)
      expect(result).to eq(num)
    end
  end

  describe '#divide' do
    it 'divide two numbers' do
      calc = Calculator.new
      result = calc.divide(4, 2)
      expect(result).to eq(2)
    end

    it 'raises error when dividing by zero' do
      calc = Calculator.new
      expect { calc.divide(4, 0) }.to raise_error(ZeroDivisionError)
    end
  end
end

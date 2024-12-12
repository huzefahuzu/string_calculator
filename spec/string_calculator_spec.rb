require 'string_calculator'

RSpec.describe StringCalculator do 
  describe '#add' do 
    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number itself for a single number' do
      calculator = StringCalculator.new
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns the sum of two numbers seperated by comma' do
      calculator = StringCalculator.new
      expect(calculator.add('1,2')).to eq(3)
    end

    it 'returns the sum of an unknown amount of numbers' do
      calculator = StringCalculator.new
      expect(calculator.add('1,2,3,4,5')).to eq(15)
    end

    it 'returns the sum when numbers are seperated by commas and newlines' do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'returns the sum when using a custom delimiter' do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception for a single negative  number' do
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,3") }.to raise_error("negatives not allowed: -2")
    end

    it 'raises an exception for multiple negative numbers' do 
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,-3,4") }.to raise_error("negatives not allowed: -2, -3")
    end

    it 'ignores numbers greater than 1000' do
      calculator = StringCalculator.new
      expect(calculator.add("2, 1001")).to eq(2)
    end

    it 'includes numbers less than or equal to 1000 in the sum' do
      calculator = StringCalculator.new
      expect(calculator.add("2,1000")).to eq(1002)
    end

    it 'returns the sum when using a custom delimiter of any length' do
      calculator = StringCalculator.new
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'returns the sum when using multiple custom delimiters' do 
      calculator = StringCalculator.new
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'returns the sum when using multiple delimiters of varying lengths' do
      calculator = StringCalculator.new
      expect(calculator.add("//[***][%%]\n1***2%%3")).to eq(6)
    end
  end
end

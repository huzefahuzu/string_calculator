require 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'with default delimiters (comma and newline)' do
      it 'returns 0 for an empty string' do
        expect(calculator.add('')).to eq(0)
      end

      it 'returns the number itself for a single number' do
        expect(calculator.add('1')).to eq(1)
      end

      it 'returns the sum of two numbers separated by a comma' do
        expect(calculator.add('1,2')).to eq(3)
      end

      it 'returns the sum of an unknown amount of numbers' do
        expect(calculator.add('1,2,3,4,5')).to eq(15)
      end

      it 'returns the sum when numbers are separated by commas and newlines' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'with a single custom delimiter' do
      it 'returns the sum when using a single-character custom delimiter' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end

      it 'returns the product when using single-character * delimiter' do 
        expect(calculator.add("//*\n2*2*3")).to eq(12)
      end

      it 'returns the sum when using a custom delimiter of any length' do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'with negative numbers' do
      it 'raises an exception for a single negative number' do
        expect { calculator.add("1,-2,3") }.to raise_error("negatives not allowed: -2")
      end

      it 'raises an exception for multiple negative numbers' do
        expect { calculator.add("1,-2,-3,4") }.to raise_error("negatives not allowed: -2, -3")
      end
    end

    context 'with large numbers' do
      it 'ignores numbers greater than 1000' do
        expect(calculator.add("2,1001")).to eq(2)
      end

      it 'includes numbers less than or equal to 1000 in the sum' do
        expect(calculator.add("2,1000")).to eq(1002)
      end
    end

    context 'with multiple custom delimiters' do
      it 'returns the sum when using multiple custom delimiters' do
        expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
      end

      it 'returns the sum when using multiple delimiters of varying lengths' do
        expect(calculator.add("//[***][%%]\n1***2%%3")).to eq(6)
      end

      it 'returns the sum when using multiple delimiters of varying lengths and characters' do
        expect(calculator.add("//[***][%%%]\n1***2%%%3")).to eq(6)
      end
    end
  end
end

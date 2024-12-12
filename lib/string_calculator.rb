class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?    

    delimiter = ",|\n" # Default delimiters: comma or newline

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      delimiter = Regexp.escape(header[2])
    end

    # Split numbers and convert to integers
    numbers_array = numbers.split(/#{delimiter}/).map(&:to_i)

    # Find negatives
    negatives = numbers_array.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    # Calculate and return the sum
    numbers_array.reject{ |n| n > 1000 }.sum
  end
end

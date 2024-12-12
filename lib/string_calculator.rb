class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?    

    # Default delimiters: comma or newline
    delimiter = ",|\n" 

    delimiter, numbers = parse_delimiter(numbers)

    # Split numbers and convert to integers
    numbers_array = numbers.split(/#{delimiter}/).map(&:to_i)

    # Find negatives
    negatives = numbers_array.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    # Calculate and return the sum ignoring numbers greater than 1000
    numbers_array.reject{ |n| n > 1000 }.sum
  end

  private

  def parse_delimiter(numbers) 
    if numbers.start_with?("//") 
      header, numbers = numbers.split("\n", 2) 
      delimiter = if header.match(%r{//\[(.+)\]}) 
        parse_multiple_delimiters(header.match(%r{//\[(.+)\]})[1])
      else 
        Regexp.escape(header[2]) 
      end 

      [delimiter, numbers] 
    else 
      [",|\n", numbers] 
    end 
  end

  def parse_multiple_delimiters(delimiter_string)
    delimiters = delimiter_string.scan(/\[([^\]]+)\]/).flatten 
    delimiters.map { |delim| Regexp.escape(delim) }.join('|')
  end
end

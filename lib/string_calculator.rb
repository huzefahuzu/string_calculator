class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    delimiter, numbers = parse_delimiter(numbers)

    parsed_numbers = split_numbers(numbers, delimiter)
    check_for_negatives!(parsed_numbers)

    sum_ignoring_large_numbers(parsed_numbers)
  end

  private

  # Determines the delimiter pattern and extracts the numbers portion of the input.
  def parse_delimiter(numbers)
    return [",|\n", numbers] unless numbers.start_with?("//")

    header, remaining_numbers = numbers.split("\n", 2)
    delimiter = extract_delimiter_from_header(header)
    [delimiter, remaining_numbers]
  end

  # Extracts a single or multiple delimiters from the header line.
  def extract_delimiter_from_header(header)
    multiple_delimiters = header.match(%r{//(\[.+\])})
    if multiple_delimiters
      parse_multiple_delimiters(multiple_delimiters[1])
    else
      # Single-character delimiter after '//'
      Regexp.escape(header[2])
    end
  end

  # Parses multiple delimiters from a string like "[***][%%]"
  def parse_multiple_delimiters(delimiter_string)
    delimiters = delimiter_string.scan(/\[([^\]]+)\]/).flatten
    delimiters.map { |delim| Regexp.escape(delim) }.join('|')
  end

  # Splits the numbers string using the given delimiter pattern, returning an array of integers.
  def split_numbers(numbers, delimiter_pattern)
    numbers.split(/#{delimiter_pattern}/).map(&:to_i)
  end

  # Raises an error if any of the parsed numbers are negative.
  def check_for_negatives!(parsed_numbers)
    negatives = parsed_numbers.select { |n| n < 0 }
    return if negatives.empty?

    raise "negatives not allowed: #{negatives.join(', ')}"
  end

  # Returns the sum of all numbers except those greater than 1000.
  def sum_ignoring_large_numbers(parsed_numbers)
    parsed_numbers.reject { |n| n > 1000 }.sum
  end
end

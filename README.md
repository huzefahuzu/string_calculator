# String Calculator 🚀

A straightforward, rule-driven calculator that interprets string inputs and executes operations step-by-step.

---

## Table of Contents 💡
- [Key Concepts](#key-concepts)
- [Installation & Setup](#installation--setup)
- [Running the Tests](#running-the-tests)
- [Usage Examples](#usage-examples)

---

### Key Concepts 🔑

1. **Red-Green-Refactor**: Always start with a failing test, implement minimally, then improve readability and structure.
2. **Incremental Enhancement**: Add complexity one step at a time, ensuring each layer is well-tested.

---

### Installation & Setup 🗂

1. **Clone the Repository**:
   ```bash
   git clone git@github.com:huzefahuzu/string_calculator.git
   cd string_calculator
   ```

2. **Install Dependencies**:
   ```bash
   bundle install
   ```

3. **Run Tests**:
   ```bash
   rspec
   ```


---

### Running the Tests ✅:

   ```bash
   StringCalculator
     #add
       with default delimiters (comma and newline)
         returns 0 for an empty string
         returns the number itself for a single number
         returns the sum of two numbers separated by a comma
         returns the sum of an unknown amount of numbers
         returns the sum when numbers are separated by commas and newlines
       with a single custom delimiter
         returns the sum when using a single-character custom delimiter
         returns the sum when using a custom delimiter of any length
       with negative numbers
         raises an exception for a single negative number
         raises an exception for multiple negative numbers
       with large numbers
         ignores numbers greater than 1000
         includes numbers less than or equal to 1000 in the sum
       with multiple custom delimiters
         returns the sum when using multiple custom delimiters
         returns the sum when using multiple delimiters of varying lengths
         returns the sum when using multiple delimiters of varying lengths and characters

   Finished in 0.00146 seconds (files took 0.02901 seconds to load)
   14 examples, 0 failures
   ```
---


### Usage Examples 🎯:

   ```bash
   require_relative 'lib/string_calculator'

   calculator = StringCalculator.new
   puts calculator.add("1,2,3")             # => 6
   puts calculator.add("1\n2,3")            # => 6 (handles newlines)
   puts calculator.add("//;\n1;2")          # => 3 (custom delimiter)
   puts calculator.add("//[***]\n1***2***3")# => 6 (multi-length delimiter)
   puts calculator.add("//[*][%]\n1*2%3")   # => 6 (multiple delimiters)
   puts calculator.add("1,-2")              # raises "negatives not allowed: -2"
   ```

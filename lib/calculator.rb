require 'pry'

class Calculator
  
  OPERATORS = ["*", "/", "+", "-"]
  
  def self.calculate(string)
    return 0 if string.empty?
    return string.to_f if string_does_not_contain_operators?(string) || string.to_f < 0
    
    index_of_next_operator = detect_next_operator(string)
    operator = string[index_of_next_operator]
    next_operation = locate_numbers_around_next_operator(index_of_next_operator, string)
    case operator 
    when "*"
      result = multiply(next_operation)
    when "/"
      result = divide(next_operation)
    when "+"
      result = add(next_operation)
    when "-"
      result = subtract(next_operation)
    end
    string.sub! next_operation, result
    p string
    calculate(string)
  end
  
  def self.detect_next_operator(string)
    string.split("").each_with_index do |character, index|
      return index if ["*", "/"].include?(character)
    end
    
    string.split("").each_with_index do |character, index|
      return index if ["+", "-"].include?(character)
    end
  end
  
  def self.locate_numbers_around_next_operator(index_of_operator, string)
    substring = string[index_of_operator]
    characters = string.split("")
    j = index_of_operator - 1
    ((index_of_operator-1).downto(0)).each do |i|
      break if OPERATORS.include?(string[i]) || string[i].nil?
       substring = string[i] + substring
    end
    
    ((index_of_operator+1)..string.length+1).each do |i|
      break if OPERATORS.include?(string[i]) || string[i].nil?
      substring += string[i] 
    end
    substring
  end
  
  def self.add(string)
    numbers = string.split("+")
    (numbers.first.to_f + numbers.last.to_f).to_s
  end

  def self.subtract(string)
    numbers = string.split("-")
    (numbers.first.to_f - numbers.last.to_f).to_s
  end
  
  def self.divide(string)
    numbers = string.split("/")
    (numbers.first.to_f / numbers.last.to_f).to_s
  end
  
  def self.multiply(string)
    numbers = string.split("*")
    (numbers.first.to_f * numbers.last.to_f).to_s
  end
  
  def self.string_does_not_contain_operators?(string)
      OPERATORS.each do |operator|
        return false if string.include?(operator)
      end
      true
  end

end


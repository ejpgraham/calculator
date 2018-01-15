require_relative 'calculator.rb'

p "Enter the equation you want to calculate."
input_string = gets.chomp
p Calculator.calculate(input_string)

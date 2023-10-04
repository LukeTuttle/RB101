0.upto(9) {|sp| p "#{' ' * sp}The Flinstones Rock!" }

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

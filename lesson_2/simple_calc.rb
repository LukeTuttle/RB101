def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def do_math(left, right, operator)
  case operator
  when '+'
    left + right
  when '-'
    left - right
  when 'x'
    left * right
  when '/'
    left.to_f / right
  end
end

def operation_to_message(op)
  case op
  when '+'
    'Adding'
  when '-'
    'Subtracting'
  when 'x'
    'Multiplying'
  when '/'
    'Dividing'
  end
end

prompt "Welcome to the Simple Calculator! Enter your name:"

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt "Make sure to use a valid name."
  else
    break
  end
end

prompt "Hi #{name}"
# main loop
loop do
  prompt "enter the number on the left hand side"
  left_operand = ''
  loop do
    left_operand = gets.chomp.to_i
    if valid_number?(left_operand)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  prompt "enter the number on the right hand side"
  right_operand = ''
  loop do
    right_operand = gets.chomp.to_i
    if valid_number?(right_operand)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  prompt "Now enter the appropriate operation to be performed (+ - x /)"

  operator = ''
  loop do
    operator = gets.chomp
    break if %w(x - + /).include? operator
    prompt 'You must choose (x - + /)'
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = do_math(left_operand, right_operand, operator)
  prompt "#{left_operand} #{operator} #{right_operand} = #{result}"

  prompt "Do you want to perform another calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thank you for using the calculator"

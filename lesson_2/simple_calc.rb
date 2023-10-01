require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(key, lang='en')
  MESSAGES[lang][key]
end

def prompt(message, override=false)
  if override
    puts "=> #{message}"
  else
    message_output = messages(message, LANGUAGE)
    puts "=> #{message_output}"
  end
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
  msg = case op
        when '+'
          'Adding'
        when '-'
          'Subtracting'
        when 'x'
          'Multiplying'
        when '/'
          'Dividing'
        end
  msg
end

prompt('welcome')

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt('valid_name')
  else
    break
  end
end

prompt("Hi #{name}", true)
# main loop
loop do
  prompt("first_num")
  left_operand = ''
  loop do
    left_operand = gets.chomp.to_i
    if valid_number?(left_operand)
      break
    else
      prompt("valid_number")
    end
  end

  prompt("second_num")
  right_operand = ''
  loop do
    right_operand = gets.chomp.to_i
    if valid_number?(right_operand)
      break
    else
      prompt("valid_number")
    end
  end

  prompt('operation')
  operator = ''
  loop do
    operator = gets.chomp
    break if %w(x - + /).include? operator
    prompt('valid_operation')
  end

  prompt("#{operation_to_message(operator)} the two numbers...", true)

  result = do_math(left_operand, right_operand, operator)
  prompt("#{left_operand} #{operator} #{right_operand} = #{result}", true)

  prompt('go_again?')
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt('goodbye')

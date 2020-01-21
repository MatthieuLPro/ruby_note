require 'time'

=begin
p "#### Ruby version ####"
p RUBY_VERSION
p RUBY_PATCHLEVEL

p "#### Current date ####"
p "Current Date and Time: #{ Time.now.strftime "%d/%m/%Y %H:%M" }"
=end

p "#### Pyramid ####"
def pyramid(n)
  return if n < 1

  limit = 0

  puts 'A' * limit += 1 while(limit < n)
end

def circle_param
  p "#### Circle ####"
  p "Input the radius of the circle:"

  radius = gets.chomp.to_i

  perimeter = 2 * Math::PI * radius
  area      = Math::PI * radius ** 2

  p "The perimeter is #{perimeter}"
  p "The area is #{area}."
end

def multiply_number
  p "#### Multiply ####"
  p "Input the values"

  value1 = gets.chomp.to_f
  value2 = gets.chomp.to_f

  p "#{value1} * #{value2} = #{value1 * value2}"
end

def file_extension
  p "#### File extenstion ####"
  p "Input the file name"

  file_name = gets.chomp

  return p 'Wrong format' unless file_name.include?('.') && file_name.count('.') == 1

  extension = file_name.split('.').last

  return p 'Wrong format' if file_name.split('.').first == '' || extension.empty?

  p "Extension is: .#{extension}"
  p "Path is: .#{File.dirname(file_name)}"
end

def three_number
  p "#### Three numbers ####"
  p 'Gives the 3 numbers: '

  value1 = gets.chomp.to_i
  value2 = gets.chomp.to_i
  value3 = gets.chomp.to_i

  if (Array(1..10) & [value1, value2, value3]).empty?
    p false
  else
    p true
  end
end

def print_me
  p "#### Print me ####"
  puts (
<<-eos
Sample string :
a string that you "don't" have to escape
This
is a ....... multi-line
heredoc string --------> example
eos
  )
end

def string_verification
  p "#### String verification ####"
  puts "Get string: "

  str = gets.chomp

  if str[0..1] == 'if'
    puts str
  else
    puts "if #{str}"
  end
end

def insert_middle
  p "#### String manipulation ####"
  puts "Get string: "
  str = gets.chomp

  return p "Wrong format" if str.empty?

  puts "Get string with 2 characters"
  str2 = gets.chomp

  return p "Wrong format" if str2.length < 2

  puts str2[0] + str + str2[1]
end

p "#### Regex experience ####"
def regex_exp
  p "5.5".match(/\d\.\d/)
end

def ip_address(str)
  !!(str =~ //)
end

regex_exp


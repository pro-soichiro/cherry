gem 'debug'
require 'debug'

def fizz_buzz(num)
  binding.break
  if num % 15 == 0
    "Fizz Buzz"
  elsif num % 5 == 0
    "Buzz"
  elsif num % 3 == 0
    "Fizz"
  else
    num.to_s
  end
end

fizz_buzz(1) #=> 1
fizz_buzz(2) #=> 2
fizz_buzz(3) #=> Fizz
fizz_buzz(4) #=> 4
fizz_buzz(5) #=> Buzz
fizz_buzz(6) #=> Fizz
fizz_buzz(15) #=> Fizz Buzz


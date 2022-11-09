# * 3で割り切れる数値を引数に渡すと、"Fizz"を返す。
# * 5で割り切れる数値を引数に渡すと、"Buzz"を返す。
# * 15で割り切れる数値を引数に渡すと、"Fizz Buzz"を返す。
# * それ以外の数値はその数値を文字列に変えて返す。

def fizz_buzz(num)
  if num % 15 == 0
    puts "FizzBuzz"
  elsif num % 5 == 0
    puts "Buzz"
  elsif num % 3 == 0
    puts "Fizz"
  else
    puts num.to_s
  end
end

fizz_buzz(1) #=> 1
fizz_buzz(2) #=> 2
fizz_buzz(3) #=> Fizz
fizz_buzz(4) #=> 4
fizz_buzz(5) #=> Buzz
fizz_buzz(6) #=> Fizz
fizz_buzz(15) #=> Fizz Buzz
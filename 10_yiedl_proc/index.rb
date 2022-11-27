def greet
  puts 'おはよう'
  puts 'こんばんは'
end

# 通常の呼びだし
greet

# ブロック付きメソッド呼び出し
greet do
  puts 'こんにちは'
end

# 今のままでは、上記の二つの出力結果は同じ。


def greet
  puts 'おはよう'
  yield
  puts 'こんばんは'
end

# ブロック付きメソッド呼び出し
greet do
  puts 'こんにちは'
end
# おはよう
# こんにちは
# こんばんは

=begin

yieldはブロックの処理を実行する

yieldはメソッド内で複数回呼び出せる

=end



=begin

ブロックなしで呼び出されている場合に
yieldでブロックを呼び出していると
エラーになる。

greet
=> no block given (yield) (LocalJumpError)

そんな時には「block_given?」を使う。

=end


def greet
  puts 'おはよう'
  yield if block_given?
  puts 'こんばんは'
end

# ブロックなし
greet
# おはよう
# こんばんは


# ブロック付きメソッド呼び出し
greet do
  puts 'こんにちは'
end
# おはよう
# こんにちは
# こんばんは


=begin

yieldはブロックを引数に渡したり、
ブロックの戻り値を受け取ったりできる。

=end


def greet
  puts 'おはよう'

  text = yield 'こんにちは'
  puts text

  puts 'こんばんは'
end 


greet do |text|
  text * 2
end
#=> おはよう
#   こんにちはこんにちは
#   こんばんは



=begin

ブロックを引数として明示的に受け取る

=end


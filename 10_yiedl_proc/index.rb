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

ブロックを引数として受け取る場合は、
引数名の前に&をつける。
また、そのブロックを実行する場合は
callメソッドを使用する。

=end

def greet(&block)
  puts 'おはよう'

  unless block.nil?
    text = block.call('こんにちは')
    puts text
  end
  puts 'こんばんは'
end

greet
#=> おはよう
#   こんばんは

greet do |text|
  text * 2
end
#=> おはよう
#   こんにちはこんにちは
#   こんばんは

=begin

[ ブロックを引数にするメリット ]

ブロックを他のメソッドに引き渡せるようになる

例えば、日本語版と英語版のgreetメソッドを用意する例
1つの共通処理用のメソッドを複数の別メソッドから呼びだし、
それぞれのメソッドにあった処理結果を返したい時

=end


# 日本語版のgreetメソッド
def greet_ja(&block)
  texts = ['おはよう', 'こんにちは', 'こんばんは']
  greet_common(texts, &block)
end

# 英語版のgreetメソッド
def greet_en(&block)
  texts = ['good morning', 'hello', 'good evening']
  greet_common(texts, &block)
end

# 出力処理用の共通メソッド
def greet_common(texts, &block)
  puts texts[0]
  puts block.call(texts[1])
  puts texts[2]
end


greet_ja do |text|
  text * 2
end
#=> おはよう
#   こんにちはこんにちは
#   こんばんは

greet_en do |text|
  text.upcase
end
#=> good morning
#   HELLO
#   good evening



=begin

[ blockを引数で渡せることのメリット2 ]

渡されたブロックに対してメソッドを呼びだし、
必要な情報を取得したり、
ブロックに対する何かしらの操作を実行したりできるようになる。

例えば、ブロックパラメータの個数に応じて、
yieldで渡す引数の個数と内容を変えることができる。
(arityというブロックパラメータの個数を確認するメソッドを使用する)

=end

def greet(&block)
  puts 'おはよう'
  text =
    if block.arity == 1
      yield 'こんにちは'
    elsif block.arity == 2
      yield 'こんに','ちは'
    end
  puts text
  puts 'こんばんは'
end

greet do |text|
  text * 2
end
#=> おはよう
#   こんにちはこんにちは
#   こんばんは

greet do |text_1, text_2|
  text_1 * 2 + text_2 * 2
end
#=> おはよう
#   こんにこんにちはちは
#   こんばんは










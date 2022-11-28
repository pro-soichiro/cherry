=begin

Procクラスはブロックをオブジェクト化するためのクラス

Stringであれば文字列
Integerであれば整数
Procであればブロック（何らかの処理、手続き）

Proc（プロック）
語源はProcedure（プロシージャ）「手続き」という意味。

=end

# "Hello!"という文字列を返すProcオブジェクトを作成する
hello_proc = Proc.new do
  'Hello!'
end

p hello_proc.call
#=> "Hello!"


=begin

callメソッドとは?

Procクラスのインスタンスメソッド
手続きを実行してその結果を返す。

=end


# 引数を利用することも可能

add_proc = Proc.new { |a, b| a + b }
p add_proc.call(10, 20)
#=> 30

# yield と似ているな


# デフォルト値の設定も可能

add_proc = Proc.new { |a = 0, b = 0| a + b }
p add_proc.call #=> 0
p add_proc.call(10) #=> 10
p add_proc.call(0, 20) #=> 20


# newの代わりにprocを使う

p_proc = proc { |a| p a }
p_proc.call('test')
#=> "test"

=begin
JavaScriptの関数オブジェクトと同じ

const addProc = (a,b) => a + b
addProc(10,20) #=> 30

=end

add_proc = proc { |a,b| a + b }
add_proc.call(10,20) #=> 30



=begin

Procオブジェクトは引数に渡せるので、
あらかじめ作成しておいたprocを渡すこともできる

JavaScriptの関数を渡すのと同じ

const repeatProc = (text) => {
  return text * 2
}

function greet(fn) {
  console.log(fn('こんにちは'))
}

greet(repeatProc)
#=> こんにちはこんにちは

=end

repeat_proc = proc { |text|
  text * 2
}

def greet(&block)
  p block.call('こんにちは')
end

greet(&repeat_proc)
#=> こんにちはこんにちは


=begin

- Rubyの場合は引数にprocを渡す場合、受け取る側で&がついているときは
　渡す時も&をつけること
- 受け取る側で&がついていない場合は、渡す時も省略できる
- 実行したい場合はcallメソッドを使用すること
- ブロック付きメソッド呼び出しでない場合は&を省略できる
- ブロック付きメソッド呼び出しや、ブロックを渡す場合には最大一つしか渡せない
- あらかじめ用意したprocを引数として渡す場合、渡せる個数に制限はない

=end

rep_proc = proc { |text| text * 2 }
up_proc = proc { |text| text.upcase }

def greet(proc1, proc2)
  p proc1.call('hello')
  p proc2.call('hello')
end

greet(rep_proc, up_proc)
#=> "hellohello"
#   "HELLO"
















# putsとpの違い
#
# putsは戻り値がnilになる
# pは引数がそのまま戻り値になる


# putsの場合
def calc(num)
  result = puts num * 3
  p "結果は#{result}です"
end

calc(2)
#=> 6
#   "結果はです"

# pの場合
def calc(num)
  result = p num * 3
  p "結果は#{result}です"
end

calc(2)
#=> 6
#   "結果は6です"




# tapメソッドでメソッドチェーンをデバッグする

a = 'hello'.tap { |s| puts "<<#{s}>>" }
#=> <<hello>>

p a
#=> "hello"


'#043c78'.scan(/\w\w/).map(&:hex)
# hexは String#hex で文字列を16進数の数値へ変換するメソッド

# scanは String#scan でselfに対して引数を繰り返しマッチし、
#        マッチした部分文字列の配列を返す。

# tapメソッドを使って、scanメソッドの戻り値をターミナルに表示する
'#043c78'.scan(/\w\w/).tap { |a| p a }.map(&:hex)
#=> ["04", "3c", "78"]

'#043c78'.scan(/\w\w/).map(&:hex).tap { |a| p a }
#=> [4, 60, 120]



# debug.gemで使用できる主なコマンド
 
=begin

gem 'debug'
require 'debug'

binding.break



- step/s 

実行を1行進めて停止する。
その行にメソッド呼び出しがあれば、そのメソッドの中に
入って停止する（ステップイン）。


- next/n

実行を1行進めて停止する。
その行にメソッド呼び出しがあれば、
そのメソッドを実行してから次の行で停止する
（ステップオーバー）。


- finish/fin

現在実行中のメソッドを最後まで実行し、
呼び出し元に戻ってきたところで停止する
（ステップアウト）。


- continue/c

プログラムを再開する。
停止すべきポイント（ブレークポイント）がなければ、
そのプログラムの最後までプログラムを実行する。


- p式 もしくは pp式

Rubyのpメソッドやppメソッドのように、指定された式の値を表示する


- リターンキー

直前に実行したコマンドを繰り返す


- help/h

使用可能なコマンドとその説明を表示する。
help + コマンド名で特定のコマンドのヘルプを表示することもできる。
（help c など）


- quit/q またはctrl + d

デバッガを途中で終了する。
quitの代わりにquit!(q!)と入力すると、
確認なしで即座に終了する。



# binding.irb


binding.irbはgemのインストールや、ライブラリをrequireすることなく
デバッグすることができる。
ステップ実行はできない。


Method#source_location
ソースコードのファイル名と行番号を配列で返す。

=end

num = 10
text = 'hello'

class Foo
  def foo; end
end


binding.irb

m = Foo.new.method(:foo)
#=> #<Method: Foo#foo>
m.source_location
#=> ["index.rb", 136]



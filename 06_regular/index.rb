=begin

正規表現

=end


# ハッシュロケットをコロン記法へ変換させるメソッドを作る

old_syntax = <<TEXT
{
  :name => 'Alice',
  :age=>20,
  :gender  =>  :female
}
TEXT


# convert_hash_syntax(old_syntax)
# => {
#      name: 'Alice',
#      age: 20,
#      gender: :female
#    }


=begin

> text = <<TEXT
" I love Ruby.
" Python is a great language.
" Java and JavaScript are different.
" TEXT
=> "I love Ruby.\nPython is a great language.\nJava and JavaScript are different.\n"

> text.scan(/[A-Z][A-Za-z]+/)
=> ["Ruby", "Python", "Java", "JavaScript"]

> text.scan(/[A-Z][A-Za-z]+/).class
=> Array

> text = <<TEXT
" 私の郵便番号は1234567です。
" 僕の住所は6770056 兵庫県西脇市波町1234だよ。
" TEXT
=> "私の郵便番号は1234567です。\n僕の住所は6770056 兵庫県西脇市波町1234だよ。\n"

> puts text.gsub(/(\d{3})(\d{4})/) { "#{$1}-#{$2}" }
私の郵便番号は123-4567です。
僕の住所は677-0056 兵庫県西脇市波町1234だよ。
=> nil

> text = '10900202'
=> "10900202"

> puts text.gsub(/(\d{4})(\d{2})(\d{2})/) { "#{$1}/#{$2}/#{$3}" }
1090/02/02

=end


=begin

\d
「1個の半角数字」を意味する”メタ文字”

0123-34-5678
=> \d\d-\d\d\d\d-\d\d\d\d

これでマッチする
「-」はメタ文字ではないので、文字そのものを表す。

=end

text = <<-TEXT
名前：伊藤淳一
電話：01-2234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT
p text.scan /\d\d-\d\d\d\d-\d\d\d\d/
#=> ["01-2234-5678"]

=begin

名前：伊藤淳一
電話：03-1234-5678
電話：090-1234-5678
電話：0795-12-3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3

このテキストの電話番号をマッチさせるには？

正規表現では法則を見つけることがキーとなる。

今回のケースでは、
「半角数字が2~5個、ダッシュ、半角数字が1~4個、ダッシュ、半角数字が4個」

という、法則がマッチしそう。


{n, m}  {n}
文字の個数を限定するときに使うメタ文字（文字量を指定するため、量指定子と呼ばれる。）
{n, m}は、「直前の文字がn個以上、m個以下」
{n}は、「直前の文字がちょうどn個」

これらを使って、表現してみる。

=end

text = <<-TEXT
名前：伊藤淳一
電話：03-1234-5678
電話：090-1234-5678
電話：0795-12-3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3
TEXT

p text.scan /\d{2,5}-\d{1,4}-\d{4}/


=begin

名前：伊藤淳一
電話：03(1234)5678
電話：090-1234-5678
電話：0795(12)3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3

ハイフンだけでなく、カッコにも適用したい場合は？

[AB]
AまたはBのいずれか1文字を表す文字クラスの一種。

[]のなかに文字数制限はないため、
[ABC]のように記述した場合、Aまたは、Bまたは、Cのいずれか。

これらを使用して-もしくは(と、
-もしくは)を記述してみる

=end

text = <<-TEXT
名前：伊藤淳一
電話：03(1234)5678
電話：090-1234-5678
電話：0795(12)3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3
TEXT

p text.scan /\d{2,5}[-(]\d{1,4}[-)]\d{4}/






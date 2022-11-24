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


convert_hash_syntax(old_syntax)
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


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


r = /\d{3}-\d{4}/
p r.class
# => Regexp


# マッチした場合はシャシよにマッチした文字列の開始位置が返る
p '123-4567' =~ r
# => 0

# マッチしない場合はnilが返る


if '123-4567' =~ r
  p 'matched'
else
  p 'not matched'
end


# not演算子も使える
p '123-4567' !~ r
# => false



=begin
正規表現を使って文章から数字のみを引き出す
=end


text = '私の誕生日は1977年7月17日です。'

text.scan(/(\d{4})年(\d{1}|\d{2})月(\d{1}|\d{2})日/){ |s| p s }
# => ["1977", "7", "17"]

=begin
# chery本記載回答 
(\d+)年(\d+)月(\d+)日

「+」は、直前の文字やパターンが1回以上連続する

=end

text.scan(/(\d+)年(\d+)月(\d+)日/){ |s| p s }
# => ["1977", "7", "17"]


m = /(\d+)年(\d+)月(\d+)日/.match(text)

p m[0] #=> '1977年7月17日'
p m[1] #=> '1977'
p m[2] #=> '7'
p m[3] #=> '17'
p m #=> #<MatchData "1977年7月17日" 1:"1977" 2:"7" 3:"17">
p m.class #=> MatchData


=begin
matchメソッドはマッチするとMatchDataオブジェクトを返し、マッチしない場合はnilが返る。

この性質を使って、条件分岐の中で真偽値の判定とローカル変数への代入を同時にやってしまうコードがよく使用される。

=end


text = '私の誕生日は1977年7月17日です。'

if m = /(\d+)年(\d+)月(\d+)日/.match(text)
  p m[1]
else
  p 'マッチしませんでした'
end

not_match_text = '私の誕生日は1977/7/17です。'

if m = /(\d+)年(\d+)月(\d+)日/.match(not_match_text)
  p m[1]
else
  p 'マッチしませんでした'
end



=begin
名前つきキャプチャ

キャプチャは「何番目がなんの値か？」を意識しなければいけない。
そこで、キャプチャには(?<name>)というメタもじを使って名前をつけることができる。

取り出す際はシンボルか文字列

=end

text = '私の誕生日は1977年7月17日です。'
m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)

p m[:year]
p m[:month]
p m[:day]



=begin

case文での正規表現

=end

text = '03-1234-5677'

case text
when /^\d{3}-\d{4}$/
  p '郵便番号です'
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
  p '日付です'
when /^\d+-\d+-\d+$/
  p '電話番号です'
end


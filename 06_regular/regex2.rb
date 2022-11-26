=begin

正規表現のメリット

- テキストエディタでの文字列検索だけでなく、正規表現での検索を使用することで目視での調査が簡略化される。
- 文字列の処理を一文字ずつループさせたり、splitさせたりせずに、一発で処理することができる。

=end


text = <<-TEXT
クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）
TEXT

p text.split(/\n/).grep(/クープ.?バ[ケゲ]ット/)



=begin

HTMLタグをCSVへ変換する

<select name="game_console">
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>

これらのHTMLを

wii_u,Wii U
ps4,プレステ4
gb,ゲームボーイ

のようなCSVとして欲しい場合。

=end


text = <<-TEXT
<select name="game_console">
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
TEXT

p text.scan(/value="[a-z0-9_]+"/)
#=> ["value=\"wii_u\"", "value=\"ps4\"", "value=\"gb\""]

p text.scan(/>.+</)
#=> [">Wii U<", ">プレステ4<", ">ゲームボーイ<"]


=begin

「.」
任意の一文字

「+」
直前の文字が1文字以上
（量指定子）

「?」
直前の文字が1文字、または無し
（量指定子）

=end


# scanメソッドの場合

text.scan(/<option value="([a-z0-9_]+)">(.+)<\/option>/) { |s| p s }
=begin
出力結果

["wii_u", "Wii U"]
["ps4", "プレステ4"]
["gb", "ゲームボーイ"]

=end


# gsubメソッドの場合(ジーサブ)

text.gsub(/<option value="([a-z0-9_]+)">(.+)<\/option>/) { p "#{$1}, #{$2}" }
=begin
出力結果

"wii_u, Wii U"
"ps4, プレステ4"
"gb, ゲームボーイ"

=end


text = <<-TEXT
<select name="game_console">
<option value="none"></option>
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
TEXT




text.gsub(/<option value="([a-z0-9_]+)">(.+)<\/option>/) { p "#{$1}, #{$2}" }
=begin
出力結果

"wii_u, Wii U"
"ps4, プレステ4"
"gb, ゲームボーイ"


このままでは表示テキストがないoptionはマッチしない

問題はタグ内の(.+)の部分。
1文字以上ではなく、0文字以上にしてあげる必要ある。

そのためには、「*」を使用する。

「*」
任意の文字が0文字以上

「+」
任意の文字が1文字以上

=end


text.gsub(/<option value="([a-z0-9_]+)">(.*)<\/option>/) { p "#{$1}, #{$2}" }
=begin
出力結果

"none, "
"wii_u, Wii U"
"ps4, プレステ4"
"gb, ゲームボーイ"

=end


text = <<-TEXT
<select name="game_console">
<option value="none"></option>
<option value="wii_u" selected>Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
TEXT


text.gsub(/<option value="([a-z0-9_]+)">(.*)<\/option>/) { p "#{$1}, #{$2}" }
=begin
出力結果

"none, "
"ps4, プレステ4"
"gb, ゲームボーイ"


上記のように
"wii_u, Wii U"
が、表示されなくなってしまっている。

「selectedがあり、またはなし」というOR条件を追加する必要がある。

A?は　「Aがあり、もしくはない」の意味。

「?」
直前の文字が1文字、または無し
（量指定子）

この「直前」をグループ化した塊を対象にすることができる。

(ABC)?
文字列ABCがあるか、もしくはないか

という意味になる。


=end



text.gsub(/<option value="([a-z0-9_]+)"( selected)?>(.*)<\/option>/) { p "#{$1}, #{$2}" }
=begin
出力結果

"none, "
"wii_u,  selected"
"ps4, "
"gb, "


このように( selected)がキャプチャされてしまう。

キャプチャの番号を変更すればうまくいく。
text.gsub(/<option value="([a-z0-9_]+)"( selected)?>(.*)<\/option>/) { p "#{$1}, #{$3}" }

ただ、キャプチャしたくないけど()を使用したい場合は、(?: )という風に使用する。

=end


text.gsub(/<option value="([a-z0-9_]+)"(?: selected)?>(.*)<\/option>/) { p "#{$1}, #{$2}" }
=begin
出力結果

"none, "
"wii_u, Wii U"
"ps4, プレステ4"
"gb, ゲームボーイ"


[0-9]は\dに置換できる。
text.gsub(/<option value="([a-z\d_]+)"(?: selected)?>(.*)<\/option>/) { p "#{$1}, #{$2}" }


[a-z\d_]は\wに置換できる。
\w は、「英単語を構成する文字」の意味。
RubyやJavaScriptでは、\wは[a-zA-Z0-9_]という仕様になっている。

text.gsub(/<option value="(\w+)"(?: selected)?>(.*)<\/option>/) { p "#{$1}, #{$2}" }

=end


html = <<-HTML
<select name="game_console">
<option value="none"></option>
<option value="wii_u" selected>Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
HTML

replaced = html.gsub(/<option value="(\w+)"(?: selected)?>(.*)<\/option>/, '\1,\2')

puts replaced
# <select name="game_console">
# none,
# wii_u,Wii U
# ps4,プレステ4
# gb,ゲームボーイ
# </select>


=begin

+や*はしばしば「貪欲なマッチを試みる量指定子」と呼ばれる。

例えば、
<option value="ps4">プレステ4</option><option value="gb">ゲームボーイ</option>
を
<option value="(\w+)"(?: selected)?>(.*)<\/option>
で絞り込むと、

=end

html = <<-HTML
<option value="ps4">プレステ4</option><option value="gb">ゲームボーイ</option>
HTML

replaced = html.gsub(/<option value="(\w+)"(?: selected)?>(.*)<\/option>/, '\1, \2')
p replaced
# => "ps4, プレステ4</option><option value=\"gb\">ゲームボーイ\n"

# 期待していた結果は
# => "ps4, プレステ4gb, ゲームボーイ\n"

=begin

期待する結果を返すためには(.*)の部分を変更する必要がある。

具体的には、
.は任意の1文字。
*は直前の文字を0以上。
なので、

「 < 以外の任意の文字」
という表現へ変更する必要がある。

A以外の任意の文字
を表すには、
[^A]と記述する。

[]の最初に^が入ると否定の意味に変わる。
[^AB]であれば、「AでもなくBでもない任意の1文字」という意味になる。

=end

replaced = html.gsub(/<option value="(\w+)"(?: selected)?>([^<]*)<\/option>/, '\1, \2')
p replaced
# => "ps4, プレステ4gb, ゲームボーイ\n"




=begin

もう一つの解決策
最短のマッチを返すように指定する

>(.*)<
上記を下記へ
>(.*?)<

?は、最小量指定子という。

これを控えめなマッチという。

=end

replaced = html.gsub(/<option value="(\w+)"(?: selected)?>(.*?)<\/option>/, '\1, \2')
p replaced
# => "ps4, プレステ4gb, ゲームボーイ\n"

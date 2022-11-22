# ハッシュを引数として受け取り、擬似キーワード引数を実現する
def order(restrant, options = {})
  drink = options[:drink]
  food = options[:food]
  p "#{restrant}で、#{food}と#{drink}を注文しました"
end

order('ivy place', drink: 'ペールエール', food: 'フラットブレットピザ')


# キーワード引数を使用した方法
def buy(place, drink: :d, food: :f)
  p "#{place}で、#{food}と#{drink}を購入しました"
end

buy('コンビニ', drink: 'ビール', food: '唐揚げ棒')


# 状態の管理をシンボルを使用することで処理速度も可読性も上がる

status = :done

case status
when :todo
  'これからやります'
when :doing
  '今やっています'
when :done
  'もう終わりました'
end


# jsでいうスプレット演算子のようにハッシュを展開して渡すことも可能
def buy_burger(menu, drink: false, potato: false)
  p menu
  p drink
  p potato
end

params = { drink: true, potato: false }

buy_burger('fish', **params)


# 初期値が設定されていない場合、引数を渡さないとエラーになる
def buy_burger2(menu, drink: , potato: )
  p menu
  p drink
  p potato
end

# buy_burger2('fish', potato: false) #=>  missing keyword: drink (ArgumentError)



=begin
メソッドを呼び出す側は、シンボルだが、メソッドを定義する側は、シンボルではない

これはシンボルではないため、メソッド内で呼び出す際は変数として呼び出す
def method(name: 'nanashi')
  p name
end


呼び出す側はシンボル
method(name: 'john')
=end

# ハッシュで使用頻度の高いメソッド

currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }


# keys  ハッシュのキーを配列として返す
p currencies.keys
#=> [:japan, :us, :india]

# values  ハッシュのバリューを配列として返す
p currencies.values
#=> ['yen', 'dollar', 'rupee']

# has_key?/key?/include?/member?  全て同じ エイリアス
# keyが存在するかを真偽値で返す

p currencies.has_key?(:japan)
#=> true

p currencies.has_key?(:uk)
#=> false


=begin
ハッシュには他にもたくさんのメソッドが存在する。
ハッシュは大きく分けてHashクラス自身に定義されているメソッドと、
Enumerableモジュールに定義されているメソッドの2種類が存在する。
目的のメソッドを探す場合は両方の公式リファレンスに目を通すこと。
=end




# **でハッシュを展開させる JSのスプレッド演算子で展開するのと同じ

h = { us: 'dollar', india: 'rupee' }

_h = { japan: 'yen', **h }

p _h 
# => { japan: 'yen', us: 'dollar', india: 'rupee' }


# またはmergeメソッドでも可能
i = { us: 'dollar', india: 'rupee' }

_i = { japan: 'yen'}.merge(i)

p _i 
# => { japan: 'yen', us: 'dollar', india: 'rupee' }




=begin
hashを使った擬似キーワード引数

メソッドのキーワード引数はRuby2.0から導入された
元々は下記のようにhashで受け取る方法だった

この記述方法だとメソッド内での記述量が多くなる
また、下記のような擬似キーワード引数は単なるハッシュであるため、
どんなキーを渡してもエラーにはならない。

キーワード引数の場合は、メソッド内で定義したキーで引数を渡さないとエラーになる。
仮に下記のように呼び出すとキーワード引数を利用したメソッドはエラーを返してくれる。

buy_burger('fish', salad: true)
=end


# 擬似キーワード引数
def buy_burger(menu, option = {})
  p menu
  p option[:drink]
  p option[:potato]
end

buy_burger('fish', drink: 'cola', potato: true)


# Ruby2.0から導入されたキーワード引数
def buy_burger(menu, drink: false, potato: false)
  p menu
  p drink
  p potato
end

buy_burger('fish', drink: 'cola', potato: true)



=begin
任意のキーワードを受け取る**引数

変数で受けとる引数は番目のルールが適用されるがキーワード引数の場合は順不同で問題ない
ただ下記のように受け取ったothersをそのまま出力する場合は順番は引数に渡された順番が適用される
=end

def buy_burger(menu, drink: true, **others)
  puts others
end 


buy_burger('', drink: false, bag: false, dessert: false)
#=> {:bag=>false, :dessert=>false}

buy_burger('', dessert: false, bag: false)
#=> {:dessert=>false, :bag=>false}

buy_burger(bag: false, dessert: false)
#=> {}



def buy_burger(menu, drink: true, **others)
  others.each do |key, value|
    puts "key: #{key}"
    puts "value: #{value}"
  end
end 

buy_burger('', drink: false, bag: false, dessert: false)

=begin

key: bag
value: false
key: dessert
value: false

=end




=begin
[ respond_to?メソッド ]
レシーバーが引数で渡したメソッドを持っているかを真偽値で返す。

アソシエーションを組んだ時に適用されているか確認するのに使えそう。
user.posts.respond_to?(:user)
user.respond_to?(:posts)

基本的にはシンボルと文字列は別物であるが、メソッドによっては同じように振る舞う場合がある。
=end

'apple'.respond_to?('include?') #=> true
'apple'.respond_to?(:include?) #=> true


# include?メソッドは文字列とシンボルを明確に区別する

'apple'.include?('pp') #=> true
# 'apple'.include?(:pp) 
#=> no implicit conversion of Symbol into String(TypeError)



=begin
メソッド定義時の引数の順番
=end


# 通常の引数（デフォルト値なし）
def method(arg)
  p arg
end
method('a') #=> 'a'

# デフォルト値付きの引数
def method(arg = 'undefined')
  p arg
end
method('a') #=> 'a'
method() #=> 'undefined'
method #=> 'undefined'


# 可変長引数
def method(*arg)
  p arg
end
method('a','b','c') #=> ['a','b','c']
method #=> []

# キーワード引数
def method(arg1: 'arg1', arg2: 'arg2')
  p arg1
  p arg2
end
method(arg1: 'keyword1', arg2: 'keyword2')
#=> "keyword1"
#=> "keyword2"
method(arg2: 'keyword2')
#=> "arg1"
#=> "keyword2"
method
#=> "arg1"
#=> "arg2"


# **を使った任意のキーワード引数
def method(**args)
  p args
end
method(arg1: 'keyword1', arg2: 'keyword2')
#=> {:arg1=>"keyword1", :arg2=>"keyword2"}
method(arg2: 'keyword2')
#=> {:arg2=>"keyword2"}
method
#=> {}

=begin

[POINT]

複数の種類の引数を一つのメソッドで使用する場合は順番が重要。
キーワード引数だけの場合は、順不同で問題ない。
=end




=begin

[ Column1 よく使用されるイディオム ]

変数への代入と条件分岐を同時に実現するイディオム

=end

# 国名に応じて通貨を返す（該当する通貨がなければnil)
def find_currency(country)
  currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
  currencies[country]
end


# 指定された国の通貨を大文字にして返す
def show_currency(country)
  currency = find_currency(country)
  if currency
    currency.upcase
  end
end

p show_currency(:japan) #=> 'YEN'
p show_currency(:brazil) #=> nil


# 条件分岐内で直接変数に代入してしまう
def show_currency(country)
  if currency = find_currency(country)
    currency.upcase
  end
end

p show_currency(:japan) #=> 'YEN'
p show_currency(:brazil) #=> nil


# もしくはぼっち演算子を使用して条件分岐をなくす
def show_currency(country)
  currency = find_currency(country)
  currency&.upcase
end

p show_currency(:japan) #=> 'YEN'
p show_currency(:brazil) #=> nil


=begin

[ Column2 よく使用されるイディオム ]

||=を使った自己代入（nilガード)

=end

# 変数limitがnilまたはfalseであれば、10を代入する

limit = nil
p limit #=> nil

limit ||= 10
p limit #=> 10

limit ||= 20
p limit #=> 10

# 分解するとこんな感じ
# X || X = 10
# 論理演算子||は「式の全体の真偽値が確定した時点で式の評価を終了し、その時の値を戻り値として返す。

result = false || nil || 'john' || true
p result #=> john

result = false || true || 'john' || nil
p result #=> true

# 論理演算子&&は「最初に false もしくは nil となった時点で式の評価を終了し、その時の値を戻り値として返す。

result = false && nil && 'john' && true
p result #=> false

result = 'john' && true && 1 && nil
p result #=> nil

# 変数を求める式が複数行になる場合はbeginとendで囲むこともできる

limit = nil
limit ||= begin
  a = 10
  b = 20
  a + b
end
p limit #=> 30


=begin

[ Column3 よく使用されるイディオム ]

!!を使った真偽値の型変換
(確実にtrueまたはfalseを返すイディオム)

=end

$find_user = nil

def user_exists?
  # DBからユーザーを探す（なければnil）
  user = $find_user
  if user
    true
  else
    false
  end
end

p user_exists? #=> false

$find_user = { user: { name: 'john' } }

def user_exists?
  # DBからユーザーを探す（なければnil）
  user = $find_user
  if user
    true
  else
    false
  end
end

p user_exists? #=> true



# !!を使ってコンパクトに記述できる

$find_user = nil

def user_exists?
  !!$find_user
end

p user_exists? #=> false


$find_user = { user: { name: 'john' } }

def user_exists?
  !!$find_user
end

p user_exists? #=> true

=begin

!は論理否定の演算子。
!Aと書くと、Aが真であればfalseを返し、そうでなければtrueを返す。
真偽値へ変換されたAを元の値に戻すために、再度!を付与し判定させている。

=end

p !!true #=> true
p !!1 #=> true
p !!false #=> false
p !!nil #=> false



# パターンマッチの利用パターン

# value

country = 'italy'

result =
  case country
  in 'japan'
    'こんにちは'
  in 'us'
    'Hello'
  in 'italy'
    'Ciao'
  end
p result
# => "Ciao"

# case文との違いはどのパターンにもマッチしなかった場合、
# 例外が発生するという点
# case文の場合は、nilが返る


# case country
# in 'japan'
#   'こんにちは'
# in 'us'
#   'Hello'
# end
# => italy (NoMatchingPatternError)


# 例外を発生させたくない場合は、elseをつける

result = 
  case country
  in 'japan'
    'こんにちは'
  in 'us'
    'Hello'
  else
    'other'
  end
p result
# => "other"


# 例外をraiseさせることも可能
# result = 
#   case country
#   in 'japan'
#     'こんにちは'
#   in 'us'
#     'Hello'
#   else
#     raise "無名な国名です。#{country}"
#   end
# p result
# => "無名な国名です。italy (RuntimeError)"


# データ型での条件分岐も可能

value = "abc"

match_class =
  case value
  in Integer
    '整数です'
  in String
    '文字列です'
  end
p match_class
#=> "文字列です"


# variableパターン

result =
  case 'Alice'
  in obj
    "obj=#{obj}"
  end
p result
#=> "obj=Alice"
# あらゆるオブジェクトがマッチし、変数objに代入される。

# in節で事前に定義した変数の値を参照する
# ピン演算子

alice = 'Alice'
bob = 'Bob'
name = 'Bob'

result =
  case name
  in ^alice
    'aliceさん、こんにちは！'
  in ^bob
    'bobさん、こんにちは！'
  end
p result
#=> 'bobさん、こんにちは！'


# 配列をパターンマッチ

result =
  case [1, [2, 3]]
  in [a,b]
    "a=#{a}, b=#{b}"
  end
p result
#=> "a=1, b=[2, 3]"


# 配列の中の様々なクラスをマッチさせる

result =
  case ['Alice',999,3,['a','b']]
  in [String, 10..., n, Array]
    "n=#{n}"
  end
p result
#=> "n=3"


# アンダースコアで「任意の要素」を表現する

result =
  case [1,2,3]
  in [_,_,3]
    'matched'
  end
p result
#=> "matched"


# hashをパターンマッチする

result =
  case { name: 'Alice', age: 20, gender: :female }
  in { name: 'Alice', **rest}
    "rest=#{rest}"
  end
p result
#=> "rest={:age=>20, :gender=>:female}"

# 配列も同様にパターンの{}や[]などの記号は省略可能
result =
  case { name: 'Alice', age: 20, gender: :female }
  in name: 'Alice', **rest
    "rest=#{rest}"
  end
p result
#=> "rest={:age=>20, :gender=>:female}"



# asパターン
# パターンを値で行いたいが、ローカル変数としても使用したい場合

result =
  case {name: 'Alice', age: 20, gender: :female}
  in {name: String => name, age: 18.. => age}
    "name=#{name}, age=#{age}"
  end
p result
#=> "name=Alice, age=20"


result =
  case {name: 'Alice', age: 20, gender: :female}
  in {name: String, age: 18..} => person
    "person=#{person}"
  end
p result
#=> "person={:name=>\"Alice\", :age=>20, :gender=>:female}"





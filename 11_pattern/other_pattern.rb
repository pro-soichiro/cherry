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



# variableパターン

result =
  case 'Alice'
  in obj
    "obj=#{obj}"
  end
p result
#=> "obj=Alice"
# あらゆるオブジェクトがマッチし、変数objに代入される。

# ピン演算子



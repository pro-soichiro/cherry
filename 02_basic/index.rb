# セミコロンを使って、3つの文を1行に押し込める
1.to_s; nil.to_s; 10.to_s(16)


# (で改行している場合、括弧が閉じられるまで改行してもエラーにならない
10.to_s(
  16
)

# 2つの値を同時に代入する(多重代入)
a, b = 1, 2
puts a #=> 1
puts b #=> 2


# if文は最後に評価された指揮を戻り値として返す
# 戻り値を変数に代入することもできる
# どの値にも合致しなかった場合nilが返る

country = 'italy'

result =
  if country == 'japan'
    'こんにちは'
  elsif country == 'us'
    'Hello'
  elsif country == 'italy'
    'Ciao'
  else
    '???'
  end

puts result
#=> 'Ciao'


# Alice,Bob, Carolと順に検索し、最後に見つかったユーザーを変数に格納する

def find_user(name)
  if name == 'Alice'
    false
  elsif name == 'Bob'
    false
  else
    name
  end
end
user = find_user('Alice') || find_user('Bob') || find_user('Carol')
puts user #=> Carol


# 正常なユーザーであればメールを送信する
user.valid? && send_email_ro(user)
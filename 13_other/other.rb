# 文字列を受け取って、Rubyプログラムとして実行する

code = '[1,2,3].map { |n| n * 10 }'

# evalメソッドに渡すと、文字列がRubyのコードとして実行される
eval(code)
#=> [10, 20, 30]


# OSのcatコマンドでテキストファイルの中身を確認することも可能
# その場合はバッククォートを使用する
puts `cat constants.rb`


# sendメソッドはレシーバに足して指定したシンボル（または文字列）の
# メソッドを実行する

str = 'a,b,c'
str.send(:upcase)


class User
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

params = :name

user = User.new('bob')
user_name = user.send(params)

str.send(:split, ',')
#=> ["a", "b", "c"]


binding.irb

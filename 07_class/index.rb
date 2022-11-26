# Rubyは=で終わるメソッドを定義すると、変数に代入するような形式でそのメソッドを呼び出すことができる
class User
  def initialize(name)
    @name = name
  end

  # @nameを参照するためのメソッド
  # getter
  def name
    @name
  end

  # @nameを外部から変更するためのメソッド
  # setter
  def name=(value)
    @name = value
  end

end


user = User.new('soichiro')
p user.name

# Rubyが内部的にname= というメソッドを実行する。右辺がvalueとなる。
user.name = 'mamiya'
p user.name



class User
  # @nameのgetter setterメソッドが自動で定義される
  attr_accessor :name

  # attr_reader 参照
  # attr_writer 変更

  def initialize(name)
    @name = name
  end
end


user = User.new('soichiro')
p user.name

user.name = 'mamiya'
p user.name


=begin

上記のクラスをオーバーライドして使っていく。

名前の配列を渡すと、Userクラスのインスタンスを配列に入れて返す
create_usersというクラスメソッドを定義する。

ちなみに、このようなメソッドは
厳密に言うと
「クラスオブジェクトの特異メソッド」
を定義していることになるらしい。。。

=end


class User
  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end

  def hello
    "Hello, I am #{@name}."
  end
end

names = ['Alice', 'Bob', 'Carol']


users = User.create_users(names)
users.each do |user|
  p user.hello
end


=begin

インスタンスメソッド
[ String#to_i ]

Stringクラスのto_iと言うインスタンスメソッド

---------------------

クラスメソッド
[ File.exist? ( or  File::exist? )  ]

Fileクラスのexist?と言うクラスメソッド

=end





# 定数

class Product

  # デフォルトの価格を定数として定義する
  DEFAULT_PRICE = 0

  attr_reader :name, :price


  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end
end

product = Product.new('A free movie')
p product.price
# => 0







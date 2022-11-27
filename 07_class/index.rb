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



class DVD < Product
  
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end
end

dvd = DVD.new('A great movie', 1000, 120)
dvd.name #=> A great movie
dvd.price #=> 1000
dvd.running_time #=> 120


=begin

サブクラスのinitializeメソッド内で引数の数が変わらない場合、
def initialize(name, price)
  super
end

と記述することができる。
これは、
def initialize(name, price)
  super(name, price)
end

と記述したことと同じ。

ただし、
super()のように、引数なしだとエラーになる。

しかし、そもそもスーパークラスとサブクラスで実行する処理が変わらなければ、
サブクラスで同名メソッドを定義したりsuperを呼ぶ必要がない。

=end




# メソッドのオーバーライド

product = Product.new('A great movie', 1000)
p product.to_s
# => "#<Product:0x00007fec1e10f8d0>"

dvd = DVD.new('An awesome film', 3000, 120)
p dvd.to_s
# => "#<DVD:0x00007fec1e10f790>"

# もっとわかりやすいto_sクラスへ変更する

class Product
  def to_s
    "name: #{name}, price: #{price}"
  end
end

product = Product.new('A great movie', 1000)
p product.to_s
# => "name: A great movie, price: 1000"

dvd = DVD.new('An awesome film', 3000, 120)
p dvd.to_s
# => "name: An awesome film, price: 3000"


# 標準で備わっているメソッドをオーバーライドできる


# サブクラスでメソッドをオーバーライドする
class DVD < Product
  def to_s
    "name: #{name}, price: #{price}, running_time: #{running_time}"
  end
end

dvd = DVD.new('An awesome film', 3000, 120)
p dvd.to_s
# => "name: An awesome film, price: 3000, running_time: 120"


# この場合to_sメソッド内でもsuperを使用して呼び出すことができる
class DVD < Product
  def to_s
    "#{super}, running_time: #{running_time}"
  end
end

dvd = DVD.new('An awesome film', 3000, 120)
p dvd.to_s
# => "name: An awesome film, price: 3000, running_time: 120"


=begin

[ Column ]

引数名がつかない*や**
これは、可変長引数を表す記号。
普通は(*args)のように引数名をつけるが、省略する場合がある。
これには2つの意図がある。

1. superメソッドに引数をそのまま全部渡す。
  サブクラス内のメソッドでsuperを使うが、メソッド内では引数を使用しない場合
  
  def initialize(*)
    super
  end
    
2. 余分に渡された引数を無視する。
  引数を自由に受け取ってもいいが、メソッド内で使用しない場合。

  def add(a, b, *)
    a + b
  end
  
  add(1,2,3,4,5) #=> 3

=end




















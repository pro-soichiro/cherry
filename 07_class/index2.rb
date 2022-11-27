=begin

メソッドの可視性

public
protected
private

=end

class User
  def public_hello
    'public hello'
  end
  

  private

  def private_hello
    'private hello'
  end

end

user = User.new

p user.public_hello
#=> "public hello"

# user.private_hello
# => private method `private_hello' called for #<User:0x00007fa7030c73d8> (NoMethodError)


=begin

privateメソッドはクラスの中からであれば、呼び出すことができる

=end

class User
  def hello
    # selfを使うとruby2.6以前はエラーになる
    "Hello, I am #{self.name}."

    # どちらでも記述できる
    # "Hello, I am #{name}."
  end

  private

  def name
    'Alice'
  end
end

user = User.new
p user.hello
#=> "Hello, I am Alice."


=begin

Rubyは他の言語と比べてprivateの意味が異なる
Rubyのprivateではサブクラスからでも呼び出すことができる

=end


class Product
  private

  def name
    'private method'
  end
end

class DVD < Product
  def call_private
    self.name
    # name
  end
end

dvd = DVD.new
p dvd.call_private
#=> "private method"



=begin

クラスメソッドはself.method_nameでは、privateメソッドにならない。
もし、privateにしたい場合は、

class User
  
#  def self.call_class_method
#    method_name
#  end

  class << self

    def call_class_method
      method_name
    end

    private

    def method_name
    end

  end

end

User.method_name
# => これでは呼び出せない

User.call_class_method
# => 呼び出せる

=end



=begin

protected

protectedは、
そのクラス自身と、
そのサブクラスのインスタンスメソッドから "レシーバつきで" 呼び出せる。

=end

class User
  attr_reader :name
  
  def initialize(name, weight)
    @name = name
    @weight = weight
  end


  # 引数に与えたユーザーの体重と自分の体重を比較し、
  # 自分がotherより重い場合は、trueを返す

  def heavier_than?(other_user)
    other_user.weight < @weight
  end
end

# john = User.new('john', 60)
# bob = User.new('bob', 55)

# しかしこのままでは、weightが呼び出せない。

# john.heavier_than?(bob)
#=> undefined method `weight'

# このように外部には後悔したくないが、
# 同じクラスやサブクラスの中であればレシーバ付きで呼び出せるようにしたい
# 場合にprotectedを使用する

class User

  protected
  def weight
    @weight
  end
end

john = User.new('john', 60)
bob = User.new('bob', 55)

p john.heavier_than?(bob)
#=> true

# p john.weight
#=> undefined method `weight'



=begin

クラス内の定数へのアクセス

  クラス名::定数名


クラス内の定数をprivateにする

  class クラス名
    定数名 = 値

    private_constant :定数名
  end


メソッド内では定数宣言ができない
そのため、定数はクラス構文の直下か、トップレベルで行う必要がある。

=end

class Product
  DEFAULT_PRICE = 0
  PRIVATE_DEFAULT_PRICE = 0

  private_constant :PRIVATE_DEFAULT_PRICE
end

p Product::DEFAULT_PRICE
#=> 0

# p Product::PRIVATE_DEFAULT_PRICE
# => private constant Product::PRIVATE_DEFAULT_PRICE referenced (NameError)


=begin

クラスメソッドは、Rubyでは特異メソッドともいう。
これはなぜか。

=end

alice = 'I am Alice.'
bob = 'I am Bob.'

# aliceにだけ、shuffleメソッドを定義
def alice.shuffle
  chars.shuffle.join
end

p alice.shuffle
# => "laIc  m.ieA"
# p bob.shuffle
# => undefined method `shuffle' for "I am Bob.":String (NoMethodError)

=begin

def alice.shuffle
  chars.shuffle.join
end

上記は下記と同じ。

class << alice
  def shuffle
    chars.shuffle.join
  end
end

そしてこれを「shuffleは、aliceの特異メソッドである」と表現する。
別名を「クラスメソッド」ともいう。

つまり、これまで見てきたクラスメソッドは特異メソッドであった。

公式リファレンスでは、クラスメソッドではなく特異メソッドと呼ばれている。

これはクラスもオブジェクトであるためである。

=end




=begin

動的型付け言語ならではの挙動

静的型付け言語では実行前にそのメソッドが100%確実に呼び出せることを保証するためにコンパイル時に
確認している。

一方、動的型付け言語では実行時にそのメソッドが呼び出せるかどうかを判断し、
呼び出せない時にエラーが起きる。
Rubyが気にするのは
「コードを実行する瞬間に、そのメソッドが呼び出せるか否か」
であって、
「そのオブジェクトがクラス（データ型）が何か」ではない。

=end


def display_name(object)
  puts "Name is <<#{object.name}>>"
end


class Food
  def name
    '納豆'
  end
end

class Drink
  def name
    'コーラ'
  end
end

food = Food.new
drink = Drink.new

display_name(food)
#=> Name is <<納豆>>

display_name(drink)
#=> Name is <<コーラ>>


=begin
上記のようにオブジェクトに問わず、nameという同一名のメソッドさえあれば
呼び出すことができる

これを
「もしもそれがアヒルのように歩き、アヒルのように鳴くのなら、それはアヒルである」
という言葉に由来する
「ダックタイピング」と呼ばれる。

=end













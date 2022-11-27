=begin

モジュール

=end


# モジュールからインスタンスを作成することはできない。
# 他のモジュールやクラスを継承することはできない。



=begin
ユースケース

Rubyでは単一継承を採用している。
つまり、1つのクラスは1つのスーパークラスしか持てない。

もし、複数のクラスにまたがって同じような機能が必要になる場合は
このモジュールを利用する。

=end


class Product
  def title
    log 'title is called.'
    'A great movie'
  end

#  private
#
#  def log(text)
#    puts "[LOG] #{text}"
#  end
end


class User
  def name
    log 'name is called.'
    'Alice'
  end

#  private
#
#  def log(text)
#    puts "[LOG] #{text}"
#  end
end


# product = Product.new
# product.title
#=> [LOG] title is called.


# user = User.new
# user.name
#=> [LOG] name is called.


=begin
上記のように、クラスをまたいで共通した処理がある

このような時に、容易に継承を使ってはいけない。
「製品はユーザーである」
または、
「ユーザーは製品である」
という is-aの関係が成り立たないため。

このような時は、モジュールを使ってまとめることができる。
=end


module Loggable
  def log(text)
    puts "[NEW LOG] #{text}"
  end
end

class Product
  include Loggable
end

class User
  include Loggable
end

product = Product.new
product.title
#=> [NEW LOG] title is called.

user = User.new
user.name
#=> [NEW LOG] name is called.

=begin
モジュールはクラスに何個でもいくつでもincludeすることができる

クラスにモジュールをincludeして機能を追加することをミックスインという。


ただ、上記の方法だとLoggableモジュールのlogメソッドは可視性がpublicなので、
privateにする方が良い。

可視性の変更はクラスと同様に定義可能。

module Loggable
  
  private

  def log(text)
    puts "[NEW LOG] #{text}"
  end
end

=end




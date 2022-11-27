=begin

下記のコードは
module Loggableが
ミックスインするクラスがpriceというメソッドを持っていることを
期待した実装になっている。

=end

module Loggable
  def price_tag
    "#{price}円"
  end
end

class Product
  include Loggable
  
  def price
    1000
  end
end

product = Product.new
p product.price_tag
# => "1000円"



=begin

モジュールをextendする

モジュールを利用したメソッド定義のもう一つの方法。
extendを使用すると、
モジュール内のメソッドをそのクラスの特異メソッドにすることができる。

=end

module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  extend Loggable

  def self.create_products(names)
    log 'create_products is called.'
  end
end

Product.create_products([])
#=> [LOG] create_products is called.

Product.log('Hello.')
#=> [LOG] Hello.


=begin

include
モジュールをインスタンスメソッドとしてミックスインする

extend
モジュールを特異メソッドとしてミックスインする


[別の定義方法]

クラス名.include モジュール名
クラス名.extend モジュール名

=end





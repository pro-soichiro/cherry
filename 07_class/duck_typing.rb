class Product 
  def initialize(name, price)
    @name = name
    @price = price
  end


  def display_text
    stock = stock? ? 'あり' : 'なし'
    puts "商品名: #{@name} 価格: #{@price}円 在庫: #{stock}"
  end

end


class DVD < Product
  def stock?
    true
  end
end

product = Product.new('A great film', 1000)
# product.display_text
# => ここではProductクラス（オブジェクト）にstock?メソッドが存在しないためエラーとなる。
# => undefined method `stock?' for #<Product:0x00007fc01a128478 @name="A great film", @price=1000> (NoMethodError)

dvd = DVD.new('An awesome film', 3000)
dvd.display_text
# => 商品名: An awesome film 価格: 3000円 在庫: あり


=begin

このままでは、何も知らない人がProductクラスを使ったり、継承したりしたときに突然エラーがでてしまうため
適切なエラーメッセージで伝える方法がベストプラクティス

=end



class Product
  def stock?
    raise 'must implement stock? in subclass.'
  end
end

product = Product.new('A great film', 1000)
product.display_text
# => must implement stock? in subclass. (RuntimeError)


=begin

[ column ]


インスタンスが引数のものか？
instance_of?
obj.instance_of?(other_obj)

オブジェクトが引数のオブジェクトを親にもつか？
is_a?
obj.is_a?(parent_obj)

オブジェクトが引数のメソッドを持つか？
respond_to?
obj.respond_to?(:method)

=end



=begin

オーバーロード（オーバーライドではない）

引数のデータ型や個数の違いに応じて、
同じ名前のメソッドを複数定義できる。というもの。
多重定義とも呼ばれる。

ただし、この機能はRubyには存在しない。
オーバーロードをRubyで実現するにはis_a?やto_iなどを利用する
また、引数の個数についてはm引数のデフォルト値や可変長引数を使うことで、
メソッド呼び出し時の引数の個数を柔軟に変えることができる。

このようにRubyでは一つのメソッドでいろいろなデータ型や個数の引数を
受け取ることができるため、
同じ名前で複数のメソッド定義を持つ必要がない。

よって、Rubyではオーバーロードという考え方も必要ない。

=end










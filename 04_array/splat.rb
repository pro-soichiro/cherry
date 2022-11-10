def method_a(*arg)
  p "#{arg.join('と')}、こんにちは！"
end

method_a('佐藤')
method_a('佐藤','山田')
method_a('佐藤','山田','鈴木')
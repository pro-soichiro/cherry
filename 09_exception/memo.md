# 例外の記述方法色々

- 一つのrescue節に複数の例外クラスを指定する

```ruby
begin
  'abc'.foo
rescue ZeroDivisionError, NoMethodError
  puts '0で除算したか、存在しないメソッドが呼び出された'
end
```

- 例外オブジェクトを変数に格納する

```ruby
begin
  'abc'.foo
rescue ZeroDivisionError, NoMethodError => e
  puts '0で除算したか、存在しないメソッドが呼び出された'
  puts "エラー: #{e.class} #{e.message}"
end
```


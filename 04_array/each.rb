numbers = [1,2,3,4]
p numbers.each #=> #<Enumerator: [1, 2, 3, 4]:each>


# eachメソッドは配列の中身を取り出すだけ
# ブロックに行いたい処理を記述することで内容を決めていた
# ブロック内で扱うパイプで囲んで定義する変数をブロック変数という


a = [1,2,3,4]
a.delete(2)
p a #=> [1,3,4]

# ここで「配列の中身が奇数のもののみ削除する」という条件である場合
b = [1,2,3,4]
b.delete_if do |n|
  n.odd?
end
p b #=> [2,4]

# delete_ifメソッドは、
#「配列の要素を順番に取り出すこと」と
#「ブロックの戻り値が真であれば要素を削除すること」という共通処理を提供する


# ブロック引数を使わない記述もできる
sum = 0
numbers.each do
  sum += 1
end
p sum #=> 4
def judge(age)
  adult = Proc.new { |n| n > 20 }
  child = Proc.new { |n| n < 20 }

  case age
  when adult
    '大人です'
  when child
    '子供です'
  else
    'ハタチです'
  end
end

p judge(25) #=> '大人です'
p judge(18) #=> '子供です'
p judge(20) #=> 'ハタチです'



# &とto_procメソッド
language = ['Ruby','Java','Python']
reverse_proc = Proc.new { |s| s.reverse }
upcase_proc = Proc.new { |s| s.upcase }


p language.map(&reverse_proc)
#=> ["ybuR", "avaJ", "nohtyP"]

p language.map(&upcase_proc)
#=> ["RUBY", "JAVA", "PYTHON"]

# Procオブジェクトをブロックとして渡したい場合は
# 引数の前に&をつける必要がある
# &の役割は、右辺のオブジェクトに対して
# to_procメソッドを呼び出し、
# その戻り値として得られたProcオブジェクトを、
# ブロックを利用するメソッドに与える。



# RubyにはProcオブジェクト以外でto_procメソッドを持つものがある。
# その一つがシンボル。
# シンボルを変換してできたProcオブジェクトが変わっている点は、
# 実行時の引数の数によって実行される処理の内容が微妙に変化するところ。


# 例えば、
# Procオブジェクトに引数を1つ渡して実行すると、
# 1つ目の引数をレシーバにし、
# そのレシーバに対して元のシンボルと同じ名前のメソッドを呼び出す

split_proc = :split.to_proc
p split_proc #=> #<Proc:0x00007f8fa482a0d8(&:split)>
p split_proc.call('a-b-c-d e') #=> ["a-b-c-d", "e"]

upcase_proc = :upcase.to_proc
p upcase_proc #=> #<Proc:0x00007fb29c8bddb8(&:upcase)>
p upcase_proc.call('upcase proc') #=> "UPCASE PROC"


# 引数が二つの場合は、二つ目の引数がシンボルで指定した
# メソッドの第一引数になる
p split_proc.call('a-b-c-d e', '-') #=> ["a", "b", "c", "d e"]

# 引数が三つの場合は、三つ目の引数がシンボルで指定した
# メソッドの第二引数になる
p split_proc.call('a-b-c-d e', '-', 3) #=> ["a", "b", "c-d e"]


# これらを踏まえると、
['Ruby','Java','Python'].map { |s| s.upcase }
# が
['Ruby','Java','Python'].map(&:upcase)
# で記述できる理由が説明できる

# 1. &:upcaseはシンボルの:upcaseに対してto_procメソッドを呼び出す
# 2. シンボルの:upcaseがProcオブジェクトに変換され、mapメソッドにブロックとして
# 　 渡させる。
# 3. 2.で作ったProcオブジェクトはmapメソッドから配列の各要素を実行時の第一引数として
#    受け取る。
#    第1引数はupcaseメソッドのレシーバとなる。
#    つまり、配列の各要素に対してupcaseメソッドを呼び出す
# 4. mapメソッドはProcオブジェクトの戻り値を順に新しい配列に詰め込む。
# 5. 3と4のコンビネーションにより、配列の各要素が大文字に変換された新しい
#    配列がmapメソッドの戻り値になる。



# Procオブジェクトとクロージャ
# 要するに、処理を登録してあるため（参照が渡されている）
# 後から実行しても変数のスコープ等関係なく
# 処理が行われる
# 
# 生成時のコンテキスト（変数情報など）を保持している関数を
# クロージャ（closure, 関数閉包）という。
# RubyのブロックやProcオブジェクトはクロージャとして振る舞う

def generate_proc(array)
  counter = 0

  Proc.new do
    counter += 10

    array << counter
  end
end

values = []
sample_proc = generate_proc(values)
p sample_proc #=> #<Proc:0x00007fa7a58683b0@application_proc.rb:99>
p values #=> []

sample_proc.call
p values #=> [10]

sample_proc.call
p values #=> [10,20]


# lambdaが使用されているRailsのケース
# class Guitar < ApplicationRecord
#   scope :gold, -> { where(color: 'gold') }
# end

# scopeメソッドに二つの引数を渡している
# 一つ目はスコープ名の:gold
# 二つ目はクエリの本体となる、Procオブジェクト





# ミュータブルな値
a = Array.new(5, 'default')
p a #=> ["default", "default", "default", "default", "default"]
a[0].upcase!
p a #=> ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]


b = Array.new(5) { 'default' }
p b #=> ["default", "default", "default", "default", "default"]
b[0].upcase!
p b #=> ["DEFAULT", "default", "default", "default", "default"]


# イミュータブルな値
c = Array.new(5, 1)
p c
# [1, 1, 1, 1, 1]
c[0] = 2
p c
# [2, 1, 1, 1, 1]


fruits = ['apple', 'orange', 'melon']

fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}" }
#=>
# 0: apple
# 1: orange
# 2: melon

p fruits.map.with_index { |fruit, i| "#{i}: #{fruit.upcase}" }
# ["0: APPLE", "1: ORANGE", "2: MELON"]


# 名前に"a"を含み、なおかつ添え字が奇数である要素を削除する
p fruits.delete_if.with_index { |fruit, i| fruit.include?('a') && i.odd? }
# ["apple", "melon"]


# 配列の中の配列を上手に取り出す
dimensions = [
  # [縦,横]
  [10,20],
  [30,40],
  [50,60],
]
areas = []

dimensions.each do |height, width|
  areas << height * width
end

p areas
# [200, 1200, 3000]

# each_with_indexとブロックパラメータを併用する
dimensions.each_with_index do | (height, width), i |
  puts "indexが#{i}番目の面積は#{height * height}"
end
# indexが0番目の面積は100
# indexが1番目の面積は900
# indexが2番目の面積は2500


# 番号指定パラメータ
p ['1', '20', '300'].map { _1.rjust(3,'0') }
#=> ["001", "020", "300"]

p ['japan', 'us', 'italy'].map.with_index {[_2,_1]}
#=> [[0, "japan"], [1, "us"], [2, "italy"]]



dimensions.each { p _1 }
# [10, 20]
# [30, 40]
# [50, 60]

dimensions.each { p "#{_2}: #{_1}" }
# "20: 10"
# "40: 30"
# "60: 50"
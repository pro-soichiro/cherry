require 'date'

records = [
  [2021],
  [2019,5],
  [2017,11,25],
]

newRec = records.map do |record|
  case record
  in [y]
    Date.new(y,1,1)
  in [y,m]
    Date.new(y,m,1)
  in [y,m,d]
    Date.new(y,m,d)
  end
end
p records
#=> [[2021], [2019, 5], [2017, 11, 25]]
p newRec
#=> [#<Date: 2021-01-01 ((2459216j,0s,0n),+0s,2299161j)>,
#     <Date: 2019-05-01 ((2458605j,0s,0n),+0s,2299161j)>,
#     <Date: 2017-11-25 ((2458083j,0s,0n),+0s,2299161j)>]



cars = [
  {name: 'The Beatle', engine: '105ps'},
  {name: 'Prius', engine: '98ps', motor: '72ps'},
  {name: 'Tesla', motor: '306ps'}
]

# 明示的に引数を指定する場合
cars.map do |car|
  case car
  in {name: n, engine: e, motor: m}
    puts "Hybrid: #{n} / engine: #{e} / motor: #{m}"
  in {name: n, engine: e}
    puts "Gasoline: #{n} / engine: #{e}"
  in {name: n, motor: m}
    puts "EV: #{n} / motor: #{m}"
  end
end
# Gasoline: The Beatle / engine: 105ps
# Hybrid: Prius / engine: 98ps / motor: 72ps
# EV: Tesla / motor: 306ps


# 省略するとkeyと同名のローカル変数が使える
cars.map do |car|
  case car
  in {name:, engine:, motor:}
    puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
  in {name:, engine:}
    puts "Gasoline: #{name} / engine: #{engine}"
  in {name:, motor:}
    puts "EV: #{name} / motor: #{motor}"
  end
end
# Gasoline: The Beatle / engine: 105ps
# Hybrid: Prius / engine: 98ps / motor: 72ps
# EV: Tesla / motor: 306ps


# 下記のように
# inの条件に与えるhashのキー名で検索されるため、順番は関係ない。
# この場合はlast hybridが出力される
cars.map do |car|
  case car
  in {name:, motor:, engine:}
    puts "last Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
  in {name:, engine:, motor:}
    puts "first Hybrid: #{name} / engine: #{engine} / motor: #{motor}"

  # 省略
end


